package com.loning.image
{
	import com.bealearts.collection.VectorCollection;
	
	import flash.net.SharedObject;
	import flash.net.registerClassAlias;
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	
	public class ElementSettings
	{
		private static var _sharedObject:SharedObject;
		private static var _elementSettings:ElementSettings;
		public static function save():void{
			registerClassAlias("ElementSettings", ElementSettings);
			registerClassAlias("ElementSettingsItem", ElementSettingsItem);
			registerClassAlias("ElementResourceBoundSettingsItem", ElementResourceBoundSettingsItem);
			if(_sharedObject)
			{
				_sharedObject.flush();
			}
		}
		public static function load():ElementSettings{
			if(_elementSettings)
				return _elementSettings;
			registerClassAlias("ElementSettings", ElementSettings);
			registerClassAlias("ElementSettingsItem", ElementSettingsItem);
			registerClassAlias("ElementResourceBoundSettingsItem", ElementResourceBoundSettingsItem);
			_sharedObject=SharedObject.getLocal("ElementSettings");
			
			if(_sharedObject.data.data){
				try{
					_elementSettings = _sharedObject.data.data as ElementSettings;
				}catch(err:Error){
					trace(err);
				}
			}
			
			if(!_elementSettings){
				_elementSettings = new ElementSettings();
				_sharedObject.data.data=_elementSettings;
			}
			trace("item nums",_elementSettings.typeAndCategoryOptions.length);
			return _elementSettings;
		}
		
		public var typeAndCategoryOptions:Vector.<ElementSettingsItem>;
		
		
		public var weiboUserAccount:String;
		public var weiboUserPassword:String;
		
		public var drawRp:ElementResourceBoundSettingsItem;
		
		public var selectedPackages:Dictionary;
		//public var rpElementsJsonPath:String;
		
		public function get typeAndCategoryOptionsCollection():VectorCollection{
			
			return new VectorCollection(typeAndCategoryOptions);
		}
		
		public function get imageProcessingOptionsCollection():ArrayCollection{
			var collection:ArrayCollection=new ArrayCollection();
			collection.addItem(drawRp);
			return collection;
		}
		public static function loadDefault():void{
			_elementSettings=new ElementSettings();
			save();
		}
		
		public function ElementSettings()
		{
			typeAndCategoryOptions=new Vector.<ElementSettingsItem>();
			typeAndCategoryOptions.push(
				new ElementSettingsItem("rightcorner","rightcorner"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("decoration","decoration"));
			typeAndCategoryOptions.push(
			
				new ElementSettingsItem("hat","hat"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("toushi","hat"));
			
			typeAndCategoryOptions.push(
				new ElementSettingsItem("facemask","face"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("emotion","face"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("glass","face"));
			
			typeAndCategoryOptions.push(
				new ElementSettingsItem("tongue","tongue"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("random","random1"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("random","random2"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("random","random3"));

			typeAndCategoryOptions.push(
				new ElementSettingsItem("simpleframe","frame"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("randomcolorframe","frame"));
			typeAndCategoryOptions.push(
				new ElementSettingsItem("distortempty","facedistort",false));
			
			this.drawRp=
				new ElementResourceBoundSettingsItem("show_rp_value",false);
			selectedPackages=new Dictionary();
			selectedPackages["default"]=true;
			trace("load new settings");
		}
		
	}
}