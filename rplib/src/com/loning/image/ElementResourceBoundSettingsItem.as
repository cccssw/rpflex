package com.loning.image
{
	import mx.resources.ResourceManager;
	[ResourceBundle("rp")]
	public class ElementResourceBoundSettingsItem
	{
		public var selected:Boolean;
		public var key:String;

		
		public function ElementResourceBoundSettingsItem(key:String=null,selected:Boolean=true)
		{
			this.key=key;
			this.selected=selected;
		}
		public function get title():String{
			return ResourceManager.getInstance().getString("rp","title_"+key);
		}
		public function get description():String{
			return ResourceManager.getInstance().getString("rp","description_"+key);
		}
		
		public function toString():String
		{
			return this.key;
		}
		
		
	}
}