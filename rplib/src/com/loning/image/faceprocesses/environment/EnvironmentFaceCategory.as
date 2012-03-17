package com.loning.image.faceprocesses.environment
{
	import com.loning.image.faceprocesses.CategoryFaceProcessor;
	import com.loning.image.faceprocesses.CategoryItem;
	import com.loning.image.faceprocesses.EmptyFaceProcessor;
	
	public class EnvironmentFaceCategory extends CategoryFaceProcessor
	{
		public function EnvironmentFaceCategory()
		{
			super();
			this.AddProcessor(new ColorSeparatorFaceProcessor(),new CategoryItem(10,0,50));//颜色分离
			this.AddProcessor(new OutlineFaceProcessor(),new CategoryItem(5,30,80));//边缘
			this.AddProcessor(new EmbossFaceProcessor(),new CategoryItem(2,0,50));//石化
			this.AddProcessor(new InvertFaceProcessor(),new CategoryItem(10,0,40));
			
			this.AddProcessor(new OldPhotoFaceProcessor(),new CategoryItem(10,30,60));
			this.AddProcessor(new PerlinNoiseFaceProcessor(),new CategoryItem(10,0,30));//生化危机
			this.AddProcessor(new RippleFaceProcessor(),new CategoryItem(10,0,40));//扭曲
			this.AddProcessor(new SelfDisplaceFaceProcessor(),new CategoryItem(10,0,40));//
			this.AddProcessor(new SineFaceProcessor(),new CategoryItem(10,0,30));//波纹
			
			this.AddProcessor(new EmptyFaceProcessor(),new CategoryItem(5000,0,100));//空
		}
	}
}