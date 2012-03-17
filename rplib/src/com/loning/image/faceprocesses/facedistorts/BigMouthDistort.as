package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.NativeFilter;
	import com.loning.image.filters.Magnify;
	
	public class BigMouthDistort implements IFaceProcessor
	{
		public function BigMouthDistort()
		{
		}
		
		public function Process(lm:LayerManager, face:Face):void
		{
		}
		
		public function OnProcessing(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
		}
		
		public function OnProcessed(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
			//大嘴怪
			
			var filter:NativeFilter;
			var rRate:Number=1;
			filter=new Magnify(
				face.Mouth.x,
				face.Mouth.y-face.FaceRectangle.height*0.1,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
		}
		
		public function RpDescription(face:Face):String
		{
			return "大嘴怪";
		}
	}
}