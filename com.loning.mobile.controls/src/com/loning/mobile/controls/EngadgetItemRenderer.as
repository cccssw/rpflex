package com.loning.mobile.controls
{
	import flash.display.Shape;
	import flash.events.ProgressEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.styles.CSSStyleDeclaration;
	
	import spark.components.Button;
	import spark.components.IconItemRenderer;
	import spark.components.Label;
	import spark.components.supportClasses.StyleableTextField;

	use namespace mx_internal;

	public class EngadgetItemRenderer extends RightIconItemRenderer
	{
		private var rectShape:Shape;
		private var rectHeight:Number=0;  //Item中衬托message的黑色背景高度
		private var progressBar:ProgressBar;
		
		public function EngadgetItemRenderer()
		{
			super();
		}
		
		/**
		 *  @private
		 */
		override protected function layoutContents(unscaledWidth:Number,
												   unscaledHeight:Number):void
		{
			// no need to call super.layoutContents() since we're changing how it happens here
			
			// start laying out our children now
			
			var myIconWidth:Number = 0;
			var myIconHeight:Number = 0;
			var decoratorWidth:Number = 0;
			var decoratorHeight:Number = 0;
			var decoratorY:Number=0;
			var decoratorX:Number=0;
			var messageWidth:Number = 0;
			var messageHeight:Number = 0;
			var messageY:Number=0;
			var hasMessage:Boolean = messageDisplay && messageDisplay.text != "";
			
			var paddingLeft:Number   = getStyle("paddingLeft");
			var paddingRight:Number  = getStyle("paddingRight");
			var paddingTop:Number    = getStyle("paddingTop");
			var paddingBottom:Number = getStyle("paddingBottom");
			var horizontalGap:Number = getStyle("horizontalGap");
			var verticalGap:Number   = (hasMessage) ? getStyle("verticalGap") : 5;
			
			if (iconDisplay)
			{
				this.iconWidth=unscaledWidth;
				
				// 设置图标的尺寸：宽度与手机屏幕同宽。由于我们设置iconDisplay为letterbox，因此图片会自动等比例缩放
				setElementSize(iconDisplay, this.iconWidth, this.iconHeight);
				
				myIconWidth = iconDisplay.getLayoutBoundsWidth();  //实际上，myIconWidth就是item的宽度
				myIconHeight = iconDisplay.getLayoutBoundsHeight(); //myIconHeight就是item的高度
				
				//设置图片的位置，x=0,y=0
				setElementPosition(iconDisplay, 0, 0);
			}
			
			// decorator的位置居中，靠右
			if (decoratorDisplay)
			{
				decoratorWidth = getElementPreferredWidth(decoratorDisplay);
				decoratorHeight = getElementPreferredHeight(decoratorDisplay);
				//设定decorator的尺寸
				setElementSize(decoratorDisplay, decoratorWidth, decoratorHeight);
				
				// decorator居中，靠右
				decoratorX=unscaledWidth -  decoratorWidth;
				decoratorY = Math.round((unscaledHeight - decoratorHeight)/2) ;
				setElementPosition(decoratorDisplay, decoratorX, decoratorY);
				
			}
			
			// 计算message的位置和尺寸。message同图片同宽，居中靠下。
			messageWidth=myIconWidth;
			var messageTextHeight:Number = 0;
			
			if (hasMessage)
			{
				// commit styles to make sure it uses updated look
				messageDisplay.commitStyles();
			}
			
			
			if (hasMessage)
			{
				// handle message...because the text is multi-line, measuring and layout 
				// can be somewhat tricky
				messageWidth = Math.max(messageWidth, 0);
				
				// We get called with unscaledWidth = 0 a few times...
				// rather than deal with this case normally, 
				// we can just special-case it later to do something smarter
				if (messageWidth == 0)
				{
					// if unscaledWidth is 0, we want to make sure messageDisplay is invisible.
					// we could set messageDisplay's width to 0, but that would cause an extra 
					// layout pass because of the text reflow logic.  Because of that, we 
					// can just set its height to 0.
					setElementSize(messageDisplay, NaN, 0);
				}
				else
				{
					// 在resize之前，获取messageDisplay的现有高度
					var oldPreferredMessageHeight:Number = getElementPreferredHeight(messageDisplay);
					
					// 记住现有的item宽度
					oldUnscaledWidth = unscaledWidth;
					
					// 设置message的尺寸，message比屏幕宽度小paddingLeft，作为边距（此处可以设置新的style来允许定制）
					setElementSize(messageDisplay, messageWidth-paddingLeft-paddingRight, oldPreferredMessageHeight);
					
					// 在message已经确定最终宽度后，获取其最终高度。
					var newPreferredMessageHeight:Number = getElementPreferredHeight(messageDisplay);
					
					// 测试宽度改变后，message文本重新布局得到的最终高度与原来高度是否相同，如果不同，则需要调度measure()重新计算item的尺寸
					if (oldPreferredMessageHeight != newPreferredMessageHeight)
						invalidateSize();
					
					//记录获取到的message
					messageHeight = newPreferredMessageHeight;
				}
				
				//设置message的位置：居中，靠下但留下verticalGap大小的下边距
				messageY=unscaledHeight-messageHeight-verticalGap;
				setElementPosition(messageDisplay,paddingLeft,messageY);
				
				//设置message黑色背景尺寸
				rectHeight=messageHeight+verticalGap *2;
			}
			
			
			if(rectShape && rectHeight>0){
				rectShape.width=myIconWidth;
				rectShape.height=rectHeight; //totalHeight+2*verticalGap
				rectShape.x=0;
				rectShape.y=unscaledHeight-rectShape.height;
				rectShape.visible=true;
			}
			
			if(progressBar){
				progressBar.x=(unscaledWidth-52)/2;
				progressBar.y=(unscaledHeight-40)/3;
				//trace(progressBar.width)
			}
		}
		
		/**
		 *  @private
		 */
		override protected function createChildren():void
		{
			if(!rectShape){
				rectShape=new Shape();
				rectShape.visible=false;
				rectShape.graphics.beginFill(0x000000,0.7);
				rectShape.graphics.drawRect(0,0,1,1);
				this.addChild(rectShape);
			}
			super.createChildren();
		}
		
		// 创建icon,并添加事件侦听器以创建下载显示进度指示
		override protected function createIconDisplay():void{
			super.createIconDisplay();
			iconDisplay.addEventListener(ProgressEvent.PROGRESS,onIconDisplayProgress);
			iconDisplay.addEventListener(FlexEvent.READY,onIconDisplayReady);
		}
		
		// 创建icon,并删除事件侦听器
		override protected function destroyIconDisplay():void{
			super.destroyIconDisplay();
			if(progressBar && progressBar.parent){
				removeChild(progressBar)
				progressBar=null;				
			}
			iconDisplay.removeEventListener(ProgressEvent.PROGRESS,onIconDisplayProgress);
			iconDisplay.removeEventListener(FlexEvent.READY,onIconDisplayReady);
		}
		
		// 如果没有下载指示，则创建下载进度指示。这里需要判断再次添加侦听器，因为iconDisplay可能被重用，所以对应的侦听器事件已被删除
		private function onIconDisplayProgress(event:ProgressEvent):void{
			if(!progressBar){
				progressBar = new ProgressBar(iconDisplay);
				addChild(progressBar);
				this.invalidateProperties();
				this.invalidateDisplayList();
				if(iconDisplay && !iconDisplay.hasEventListener(FlexEvent.READY)){
					iconDisplay.addEventListener(ProgressEvent.PROGRESS,onIconDisplayProgress);
					iconDisplay.addEventListener(FlexEvent.READY,onIconDisplayReady);
				}
			}
			//trace(progressBar.width);
		}	
		// 删除下载进度指示
		private function onIconDisplayReady(event:FlexEvent):void{
				if(progressBar && progressBar.parent){
					removeChild(progressBar);
					progressBar=null;
				}
		}
	}
}