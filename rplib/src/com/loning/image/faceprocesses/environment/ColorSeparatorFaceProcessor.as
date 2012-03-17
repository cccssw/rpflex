package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	import com.loning.image.filters.ColorSeparator;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	public class ColorSeparatorFaceProcessor implements IFaceProcessor
	{
		public function ColorSeparatorFaceProcessor()
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
				new ColorSeparator(
					Math.random()*10+5,
					Math.random()*10,
					Math.random()*10,
					Math.random()*10,
					Math.random()*10,
					Math.random()*10));
		}
		
		public function RpDescription(face:Face):String
		{
			return "视觉分裂";
		}
	}
}