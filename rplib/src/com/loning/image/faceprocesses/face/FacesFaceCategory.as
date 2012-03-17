package com.loning.image.faceprocesses.face
{
	import com.loning.image.faceprocesses.CategoryFaceProcessor;
	import com.loning.image.faceprocesses.CategoryItem;
	import com.loning.image.faceprocesses.EmptyFaceProcessor;
	import com.loning.image.faceprocesses.face.emotions.*;
	import com.loning.image.faceprocesses.face.emotions.EmotionSmile;
	import com.loning.image.faceprocesses.face.masks.*;
	import com.loning.image.faceprocesses.face.people.Aobama;
	import com.loning.image.faceprocesses.face.people.Mykiss;
	
	public class FacesFaceCategory extends CategoryFaceProcessor
	{
		public function FacesFaceCategory()
		{
			super();
			this.AddProcessor(new EmptyFaceProcessor(),new CategoryItem(10,5,100));
			this.AddProcessor(
				new Lol(),new CategoryItem(1,0,100));
			this.AddProcessor(
				new Cheek(),new CategoryItem(4,60,100));
			this.AddProcessor(
				new Laugh(),new CategoryItem(4,60,100));
			this.AddProcessor(
				new Laughteeth(),new CategoryItem(4,60,100));
			this.AddProcessor(
				new Luoluoxiao(),new CategoryItem(4,60,100));
			this.AddProcessor(
				new Shaxiao(),new CategoryItem(4,60,100));
			this.AddProcessor(
				new Xieyan(),new CategoryItem(4,60,100));
			
			this.AddProcessor(
				new Aobama(),new CategoryItem(10,20,30));
			
			this.AddProcessor(
				new Mykiss(),new CategoryItem(1,0,1));
			
		}
	}
}