package com.loning.image
{
	import com.adobe.serializers.json.JSONDecoder;
	import com.adobe.serializers.json.JSONEncoder;
	
	import flash.utils.Dictionary;
	

	public class RpFaceProcessorManagerConfigGenerator
	{
		protected var obj:Object;
		public function process(
			jsonString:String,
			settings:ElementSettings
		):void
		{
			var decoder:JSONDecoder=new JSONDecoder();
			var config:Object = decoder.decode(jsonString);
			
			var files:Array=new Array();
			
			var hash:Dictionary=new Dictionary();
			for each(var item:ElementSettingsItem in settings.typeAndCategoryOptions){
				hash[item.toString()]=item.selected;
			}
			for(var i:int=0;i<config.files.length;i++){
				var e:Object=config.files[i];
				if(hash[e.ctg+"_"+e.eletype]){
					files.push(e);
				}
			}
			
			if(obj==null){
				obj=config;
				obj.files=new Array();
			}
			
			obj.files=obj.files.concat(files);
			
		}
		public function clear():void{
			obj=null;
		}
		public function getString():String{
			if(obj==null)
				throw new Error("obj is null");
			var encoder:JSONEncoder=new JSONEncoder();
			trace("element files",obj.files.length);
			return encoder.encode(obj);
		}
	}
}