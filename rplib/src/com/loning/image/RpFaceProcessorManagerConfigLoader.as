package com.loning.image
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import br.com.stimuli.loading.lazyloaders.LazyJSONLoader;
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	
	import flash.display.BitmapData;
	import flash.errors.IOError;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.SecurityErrorEvent;
	
	import mx.events.*;

	public class RpFaceProcessorManagerConfigLoader
	{
		
		
		
		private static var instance:RpFaceProcessorManagerConfigLoader;
		
		
		public static function get hasInstance():Boolean{
			return instance!=null;	
		}
		public function get bulkLoader():BulkLoader
		{
			return _bulkLoader;
		}

		public static function getInstance(url:String=null):RpFaceProcessorManagerConfigLoader{
			if(instance==null||url!=null){
				trace('reload rpface processor manager instance',url);
				instance=new RpFaceProcessorManagerConfigLoader(url);
			}
			return instance;
		}
		
		private var _bulkLoader:BulkLoader;
		private var faceUserInfo:FaceUserInfo;
		private var url:String;
		
		
		
		public function RpFaceProcessorManagerConfigLoader(url:String)
		{
			if(BulkLoader.getLoader(url)!=null)
			{
				trace("has found",url);
				return;
			}
			
			this.url=url;
			this.load();
		}
		
		protected function load():void{
			trace("load",url);
			var lazy:LazyJSONLoader = new LazyJSONLoader(url, url);
			_bulkLoader=lazy;
			faceUserInfo=new FaceUserInfo();
			
			lazy.decodeFunc=faceUserInfo.LoadFromJson;
			lazy.addEventListener(Event.COMPLETE, this.LazyComplete);
			lazy.addEventListener(BulkLoader.PROGRESS,this.bulkProgressChanged);
			lazy.addEventListener(BulkLoader.ERROR,onError);
			lazy.start();
			trace("start RpFaceProcessorManagerConfigLoader, bulkLoader=",_bulkLoader);
		}
		
		
		protected function onError(evt :ErrorEvent ) : void{
			
			//var item : LoadingItem = evt.target as LoadingItem;
			//trace (item.errorEvent is SecurityErrorEvent); 
			//trace (item.errorEvent is IOError); 
			trace (evt); // outputs more information 
			
			//不管三七二十一，把原恢复掉，重新load
			
		}
		
		public function forceReload():void{
			trace("force reload and clear BulkLoader of ",url);
			this.bulkLoader.removeAll();
			this.bulkLoader.clear();
			BulkLoader._allLoaders[url]=null;
			this._bulkLoader=null;
			load();
		}
		
		protected function bulkProgressChanged(e:BulkProgressEvent):void{
			trace(e);
		}
		protected function LazyComplete(e:Event):void{
			trace(bulkLoader.itemsTotal, "load finished");
		}
		
		public function createRpFaceProcessorManager(bitmapData:BitmapData,
													  theFinal:Boolean=false,
													  rpwords:String='',
													  drawText:Boolean=true,
													  drawRp:Boolean=true):RpFaceProcessorManager{
			var m:RpFaceProcessorManager=new RpFaceProcessorManager(bitmapData,
				this.faceUserInfo,
				this.bulkLoader,
				theFinal,
				rpwords,
				drawText);
			m.DrawRp=drawRp;
			return m;
		}
	}
}