package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.convolution.Emboss;
	
	public class EmbossFaceProcessor implements IFaceProcessor
	{
		public function EmbossFaceProcessor()
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
				new Emboss());
			queue.addFilter(
				new Emboss());
		}
		
		public function RpDescription(face:Face):String
		{
			return "穿越的时候成为了化石";
		}
	}
}