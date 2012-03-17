package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.faceprocesses.CategoryFaceProcessor;
	import com.loning.image.faceprocesses.CategoryItem;
	import com.loning.image.faceprocesses.facedistorts.Littleplanets.BigHairSmallFace;
	import com.loning.image.faceprocesses.facedistorts.Littleplanets.FaceInCenter;
	import com.loning.image.faceprocesses.facedistorts.Littleplanets.LeftBigFace;
	import com.loning.image.faceprocesses.facedistorts.Littleplanets.PlanetBigBottom;
	
	public class FaceDistortCategory extends CategoryFaceProcessor
	{
		public function FaceDistortCategory()
		{
			//TODO: implement function
			super();
			this.AddProcessor(
				new BigMouthDistort(),
				new CategoryItem());
			this.AddProcessor(
				new BigNorseDistort(),
				new CategoryItem());
			this.AddProcessor(
				new FaceCircleSplashDistort(),
				new CategoryItem());
			this.AddProcessor(
				new FrogEyeFaceDistort(),
				new CategoryItem());
			this.AddProcessor(
				new LongFaceDistort(),
				new CategoryItem());
			this.AddProcessor(
				new PixelateDistort(),
				new CategoryItem());
			this.AddProcessor(
				new RandomTwistDistort(),
				new CategoryItem());
			this.AddProcessor(
				new SharpHeadDistort(),
				new CategoryItem());
			
			this.AddProcessor(
				new SwellingFaceDistort(),
				new CategoryItem());
			this.AddProcessor(
				new ThinChinFaceDistort(),
				new CategoryItem());
			this.AddProcessor(
				new TwistEyeFaceDistort(),
				new CategoryItem());
			this.AddProcessor(
				new TwistNorseFaceDistort(),
				new CategoryItem());
			
			this.AddProcessor(
				new BigHairSmallFace(),
				new CategoryItem());
			this.AddProcessor(
				new FaceInCenter(),
				new CategoryItem());
			this.AddProcessor(
				new LeftBigFace(),
				new CategoryItem());
			this.AddProcessor(
				new PlanetBigBottom(),
				new CategoryItem());
			
		}
	}
}