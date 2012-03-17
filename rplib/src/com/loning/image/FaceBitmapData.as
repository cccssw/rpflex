package com.loning.image
{
	import flash.display.BitmapData;
	
	public class FaceBitmapData extends BitmapData
	{
		public var Faces:Vector.<Face>;
		public function FaceBitmapData(width:int, height:int, transparent:Boolean=true, fillColor:uint=4.294967295E9)
		{
			Faces=new Vector.<Face>();
			super(width, height, transparent, fillColor);
		}
	}
}