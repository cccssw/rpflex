package com.loning.image
{
	import mx.resources.ResourceManager;
	[ResourceBundle("rp")]
	public class ElementSettingsItem
	{
		public var selected:Boolean;
		public var type:String;
		public var category:String;
		
		public function ElementSettingsItem(type:String=null,category:String=null,selected:Boolean=true)
		{
			this.type=type;
			this.category=category;
			this.selected=selected;
		}
		public function get title():String{
			return ResourceManager.getInstance().getString("rp","type_"+type);
		}
		public function get description():String{
			return ResourceManager.getInstance().getString("rp","ctg_"+category);
		}
		
		public function toString():String
		{
			return this.category+"_"+this.type;
		}
		
		
	}
}