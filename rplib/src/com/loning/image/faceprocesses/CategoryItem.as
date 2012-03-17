package com.loning.image.faceprocesses
{
	public class CategoryItem
	{
		public var Weight:int;
		public var RpStart:int;
		public var RpEnd:int;
		public function CategoryItem(weight:int=10,rpStart:int=0,rpEnd:int=100)
		{
			Weight=weight;
			RpStart=rpStart;
			RpEnd=rpEnd;
		}
	}
}