package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import com.loning.image.filters.FadeIntoHistory;
	
	public class OldPhotoFaceProcessor implements IFaceProcessor
	{
		public function OldPhotoFaceProcessor()
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
				new FadeIntoHistory());
		}
		
		public function RpDescription(face:Face):String
		{
			return "穿越去拍旧照片";
		}
	}
}