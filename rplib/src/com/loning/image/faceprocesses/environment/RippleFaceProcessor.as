package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	import com.loning.image.filters.Ripple;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	import flash.geom.Point;

	public class RippleFaceProcessor implements IFaceProcessor
	{
		public function RippleFaceProcessor()
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
			var p:Point=face.GenRandomFacePoint();
			queue.addFilter(
				new Ripple(
					p.x,
					p.y
				));
		}
		
		public function RpDescription(face:Face):String
		{
			return "进入冥想盆";
		}
	}
}