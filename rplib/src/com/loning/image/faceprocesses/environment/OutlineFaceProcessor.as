package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.convolution.Edges;
	import de.popforge.imageprocessing.filters.color.Normalize;
	import de.popforge.imageprocessing.filters.morphological.Dilation;
	import de.popforge.imageprocessing.filters.color.LevelsCorrection;
	import com.loning.image.filters.Outline;
	
	public class OutlineFaceProcessor implements IFaceProcessor
	{
		public function OutlineFaceProcessor()
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
				new Outline());
		}
		
		public function RpDescription(face:Face):String
		{
			return "被时光的车轮碾成了线条";
		}
	}
}