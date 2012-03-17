package com.loning.image.faceprocesses.hat
{
	import com.loning.image.faceprocesses.CategoryFaceProcessor;
	import com.loning.image.faceprocesses.CategoryItem;
	import com.loning.image.faceprocesses.EmptyFaceProcessor;
	
	public class HatFaceCategory extends CategoryFaceProcessor
	{
		public function HatFaceCategory()
		{
			super();
			
			this.AddProcessor(new EmptyFaceProcessor(),new CategoryItem(50,0,100));
		}
	}
}