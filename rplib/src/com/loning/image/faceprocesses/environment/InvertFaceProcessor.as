package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import com.loning.image.filters.InvertRGB;
	
	public class InvertFaceProcessor implements IFaceProcessor
	{
		public function InvertFaceProcessor()
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
			queue.addFilter(
				new InvertRGB());
		}
		
		public function RpDescription(face:Face):String
		{
			return "像照片一样提前曝光";
		}
	}
}