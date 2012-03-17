package com.loning.image
{
	import com.adobe.serializers.json.JSONDecoder;
	import com.gskinner.utils.Rndm;
	
	import flash.utils.Dictionary;

	public class FaceUserInfo
	{
		public static var localPath:String;
		
		public static var MAX_ITEM_PER_CATEGORY:int=10;
		public var nickname:String;
		
		public var luckyDog:String;
		public var level:int;
		public var levelStart:int;
		public var levelEnd:int;
		public var levelCredits:int;
		public var conLoginDays:int;
		
		public var rps:Vector.<int>;
		public var elements:Vector.<FaceElement>;
		
		public static var Instance:FaceUserInfo;
		public function FaceUserInfo()
		{
			
		}
		public function LoadFromJson(json:String):Object{
			
			var decoder:JSONDecoder=new JSONDecoder();
			var config:Object = decoder.decode(json);
			var obj:Object=config.userinfo;
			this.nickname	= obj.nickName;
			this.level		= obj.levelInfo.level;
			this.levelStart	= obj.levelInfo.start;
			this.levelEnd	= obj.levelInfo.end;
			this.levelCredits=obj.levelInfo.levelCredits;
			this.conLoginDays=obj.conloginDays;
			this.luckyDog	= obj.luckyDog;
			if(localPath!=null)
				config.stringSubstitutions.base_path=localPath;
			config.files.source=config.files.source.sort(function taxis(element1:*,element2:*):int{
					var num:Number=Rndm.random();
					if(num<0.5){
						return -1;
					}else{
						return 1;
					}
				});
			
			
			rps=new Vector.<int>();
			var i:int;
			for(i=0;i<obj.rps.length;i++)
				rps.push(obj.rps[i]);
			elements=new Vector.<FaceElement>();
			
			var selectedFiles:Array=new Array();
			var dic:Dictionary=new Dictionary();
			
			for(i=0;i<config.files.length;i++){
				var e:Object=config.files[i];
				if(dic[e.ctg]==null){
					dic[e.ctg]=0;
				}
				dic[e.ctg]++;
				if(dic[e.ctg]>MAX_ITEM_PER_CATEGORY){
					continue;
				}
				elements.push(
					new FaceElement(
						e.id,
						e.des,
						e.eletype,
						e.weight,
						e.ctg,
						e.rps,
						e.rpe));
				selectedFiles.push(e);
			}
			config.files.source=selectedFiles;
			//trace(json);
			return config;
		}
		
	}
}