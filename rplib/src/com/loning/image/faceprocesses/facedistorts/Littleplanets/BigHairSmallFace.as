package com.loning.image.faceprocesses.facedistorts.Littleplanets
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import com.loning.image.filters.LittlePlanet;
	
	public class BigHairSmallFace implements IFaceProcessor
	{
		public function BigHairSmallFace()
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
					0,0.5));
		}
		
		public function RpDescription(face:Face):String
		{
			return "蘑菇头小乖乖";
		}
	}
}