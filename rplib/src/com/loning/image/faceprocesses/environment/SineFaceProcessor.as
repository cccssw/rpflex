package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	import com.loning.image.filters.Sine;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	public class SineFaceProcessor implements IFaceProcessor
	{
		public function SineFaceProcessor()
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
				new Sine(
					0.2*Math.random(),
					10,
					Math.round(Math.random())
				));
		}
		
		public function RpDescription(face:Face):String
		{
			return "扭曲时空准备穿越";
		}
	}
}