package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import flash.geom.Point;
	import com.loning.image.filters.Twirl;
	
	public class RandomTwistDistort implements IFaceProcessor
	{
		public function RandomTwistDistort()
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
			//随机位置  小扭曲
			
			var point:Point=face.GenRandomFacePoint();
			queue.addFilter(
				new Twirl(point.x,point.y,face.Radius,30));
		}
		
		public function RpDescription(face:Face):String
		{
			return "怪怪的表情";
		}
	}
}