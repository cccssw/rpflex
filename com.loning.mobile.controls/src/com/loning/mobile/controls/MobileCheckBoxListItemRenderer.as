package com.loning.mobile.controls
{
	import com.googlecode.bindagetools.Bind;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.binding.utils.*;
	import mx.events.DragEvent;
	
	import spark.components.CheckBox;
	import spark.components.IconItemRenderer;
	
	public class MobileCheckBoxListItemRenderer extends ListFormItemRenderer
	{
		private var cb:CheckBox;
		
		[Bindable]
		
		[Embed( 'assets/slidetoggle_on32.png' )]
		private var on32:Class;
		[Embed( 'assets/slidetoggle_off32.png' )]
		private var off32:Class;
		
		[Embed( 'assets/slidetoggle_on24.png' )]
		private var on24:Class;
		[Embed( 'assets/slidetoggle_off24.png' )]
		private var off24:Class;
		
		private var _itemSelected:Boolean;
		
		public function MobileCheckBoxListItemRenderer()
		{
			super();
			this.percentWidth=94;
			this.labelField="title";
			this.messageField="description";
			this.addEventListener(MouseEvent.CLICK,this.clickHandler);
			this.setStyle("cornerRadius","20");
			this.setStyle("borderStyle","rounded");
			
		}
		
		[Bindable(event="itemSelectedChange")]
		public function get itemSelected():Boolean
		{
			return _itemSelected;
		}
		
		public function set itemSelected(value:Boolean):void
		{
			if( _itemSelected !== value || this.decorator==null)
			{
				_itemSelected = value;
				data.selected=value;
				//trace("appDPI:"+applicationDPI);
				
				if(applicationDPI==320){
					this.decorator=_itemSelected?this.on32:this.off32;	
				}
				else if(applicationDPI==240){
					this.decorator=_itemSelected?this.on24:this.off24;	
				}
				

				//trace("change");
				dispatchEvent(new Event("itemSelectedChange"));
			}

		}

		override protected function createChildren():void
		{
			super.createChildren();
		}
		
		override public function initialize():void
		{
			// TODO Auto Generated method stub
			super.initialize();
			
		}
		protected function clickHandler(e:MouseEvent):void{
			//this.selected=false;
			this.itemSelected=!this.itemSelected;
		}
		override public  function set data(value:Object):void{
			super.data=value;
			this.itemSelected=value.selected;
		}
		
	}
}