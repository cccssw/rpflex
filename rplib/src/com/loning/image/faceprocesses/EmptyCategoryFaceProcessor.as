package com.loning.image.faceprocesses
{
	public class EmptyCategoryFaceProcessor extends CategoryFaceProcessor
	{
		public function EmptyCategoryFaceProcessor(emptyWeight:int=1)
		{
			//TODO: implement function
			super();
			this.AddProcessor(
				new EmptyFaceProcessor(),
				new CategoryItem(emptyWeight,0,100));
		}
	}
}