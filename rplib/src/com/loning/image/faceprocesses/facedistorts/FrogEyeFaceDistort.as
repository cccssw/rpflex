package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.NativeFilter;
	import com.loning.image.filters.Magnify;
	
	public class FrogEyeFaceDistort implements IFaceProcessor
	{
		public function FrogEyeFaceDistort()
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
			//青蛙眼
			
			var filter:NativeFilter;
			var rRate:Number=0.8;
			filter=new Magnify(
				face.LeftEye.x,
				face.LeftEye.y,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
			
			filter=new Magnify(
				face.RightEye.x,
				face.RightEye.y,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
		}
		
		public function RpDescription(face:Face):String
		{
			return "青蛙宝宝";
		}
	}
}