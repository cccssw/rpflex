package com.loning.image
{
	import com.adobe.serialization.json.JSONDecoder;
	
	import flash.events.Event;
	public class FacesUploadedEvent extends Event
	{
		//public static const FACES_UPLOADED:String="FACES_UPLOAED";
		public var Success:Boolean;
		public var Msg:String;
		//public var Url:String;
		public var ResponseText:String;
		public var FacesId:int;
		public var PkId:int;
		public var FPM:FaceProcessorManager;
		public function FacesUploadedEvent(
			fpm:FaceProcessorManager,
			json:String,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.FPM=fpm;
			trace(json);
			super("FacesUploaded", bubbles, cancelable);
			var decoder:JSONDecoder=new JSONDecoder(json,true);
			var obj:Object = decoder.getValue();
			ResponseText=json;
			Success=obj.success;
			Msg=obj.msg;
			if(Success){
				FacesId=obj.id;
				PkId=obj.pkid;
			}
			//Url=obj.url;
		}
	
	}
	
}