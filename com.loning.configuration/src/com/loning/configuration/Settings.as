package com.loning.configuration
{
	import flash.net.SharedObject;
	import flash.utils.*;
	import flash.net.registerClassAlias;
	public class Settings
	{
		public function Settings()
		{
		}
		
		public function save(name:String=null):void{
			/*var className:String = getQualifiedClassName( this );
			var myClass:Class = getDefinitionByName( className ) as Class;
			registerClassAlias(className, myClass);
			if(name==null)
				name=className;
			if(sharedObject==null)
			{
				sharedObject=SharedObject.getLocal(name);
			}
			sharedObject.data.data=this;
			sharedObject.flush();*/
		}
	}
}