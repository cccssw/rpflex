package com.loning.mobile.controls
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	import spark.components.Image;
	import spark.primitives.BitmapImage;

	[Event(name="iconLoaded", type="flash.events.Event")]

	
	public class ProgressBar extends UIComponent
	{
		
		protected var progressDisplay:engadgetLoader;

		
		/**
		 * Instance of imageDisplay that we are monitoring
		 */
		public var iconDisplay:BitmapImage;
		
		public function ProgressBar(iconDisplay:BitmapImage)
		{
			super();
			this.iconDisplay=iconDisplay;
			addListeners();
		}
		
		private function addListeners():void
		{
			// Add event listeners
			if (iconDisplay)
			{
				// Remove listeners if already added
				if(iconDisplay.hasEventListener(ProgressEvent.PROGRESS)){
					removeEventListener(ProgressEvent.PROGRESS,iconLoader_progressHandler);
				}
				if(iconDisplay.hasEventListener(FlexEvent.READY)){
					removeEventListener(FlexEvent.READY,iconDisplay_readyHandler);
				}
					
				iconDisplay.addEventListener(ProgressEvent.PROGRESS,iconLoader_progressHandler,false,0,true);
				iconDisplay.addEventListener(FlexEvent.READY,iconDisplay_readyHandler,false,0,true);				
			}
		}
		
		protected function showProgress(value:String):void
		{
			if (!progressDisplay)
			{
				progressDisplay = new engadgetLoader();
				addChild(progressDisplay);
				this.invalidateProperties();
				this.invalidateDisplayList();
//				progressDisplay.width=218;
//				progressDisplay.height=158;
			}
			progressDisplay.loading_text.text=value;			
		}
		
		private function iconLoader_progressHandler(event:ProgressEvent):void{
			showProgress(Math.floor(100* event.bytesLoaded / event.bytesTotal).toFixed(2) + "%");
		}

		private function iconDisplay_readyHandler(event:FlexEvent):void{
			showProgress("LOADING COMPLETE");
		}
	}
}