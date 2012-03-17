package com.loning.image.faceprocesses.facedistorts.Littleplanets
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import com.loning.image.filters.LittlePlanet;
	
	public class FaceInCenter implements IFaceProcessor
	{
		public function FaceInCenter()
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
				new LittlePlanet(
					lm.width,lm.height,
					lm.width,lm.height,
					0,0,
					0,0));
		}
		
		public function RpDescription(face:Face):String
		{
			return "孤独的看着整个世界";
		}
	}
}