package com.loning.image.faceprocesses.random
{
	import com.loning.image.faceprocesses.CategoryFaceProcessor;
	import com.loning.image.faceprocesses.CategoryItem;
	import com.loning.image.faceprocesses.EmptyFaceProcessor;
	
	public class RandomFaceCategory extends CategoryFaceProcessor
	{
		public function RandomFaceCategory()
		{
			super();
			this.AddProcessor(new EmptyFaceProcessor(),new CategoryItem(1,0,100));
			
		}
	}
}