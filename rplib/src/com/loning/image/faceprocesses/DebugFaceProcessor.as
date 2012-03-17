package com.loning.image.faceprocesses
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	public class DebugFaceProcessor implements IFaceProcessor
	{
		public function DebugFaceProcessor()
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
		}
		
		public function RpDescription(face:Face):String
		{
			return "\r\nRP:"+face.Rp+"\r\n";
		}
	}
}