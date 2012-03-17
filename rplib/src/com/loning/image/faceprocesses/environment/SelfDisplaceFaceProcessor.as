package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import com.loning.image.filters.SelfDisplace;
	
	public class SelfDisplaceFaceProcessor implements IFaceProcessor
	{
		public function SelfDisplaceFaceProcessor()
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
				new SelfDisplace(face.Center.x,face.Center.y,100,0));
		}
		
		public function RpDescription(face:Face):String
		{
			return "宇宙万物魂魄分离";
		}
	}
}