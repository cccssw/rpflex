package com.loning.image.faceprocesses
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	import com.loning.image.filters.Vignette;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	public class DarkPhotoBorderFaceProcessor implements IFaceProcessor
	{
		public function DarkPhotoBorderFaceProcessor()
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
				new Vignette(lm.width,lm.height));
		}
		
		public function RpDescription(face:Face):String
		{
			return null;
		}
	}
}