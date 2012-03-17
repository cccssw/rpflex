package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import flash.geom.Point;
	import com.loning.image.filters.CircleSplash;
	
	public class FaceCircleSplashDistort implements IFaceProcessor
	{
		public function FaceCircleSplashDistort()
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
			//脸部放射
			
			var point:Point=face.Center;
			queue.addFilter(
				new CircleSplash(point.x,point.y,face.Radius*1.5));
			
		}
		
		public function RpDescription(face:Face):String
		{
			return "光芒万丈的脑袋";
		}
	}
}