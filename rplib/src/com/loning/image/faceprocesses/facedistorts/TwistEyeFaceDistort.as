package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.NativeFilter;
	import com.loning.image.filters.Twirl;
	
	public class TwistEyeFaceDistort implements IFaceProcessor
	{
		public function TwistEyeFaceDistort()
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
			//眼睛花了
			
			var filter:NativeFilter;
			var rRate:Number=0.15;
			var angle:Number=360;
			filter=new Twirl(
				face.LeftEye.x,
				face.LeftEye.y,
				face.Radius*rRate,
				angle
			);
			queue.addFilter(filter);
			
			filter=new Twirl(
				face.RightEye.x,
				face.RightEye.y,
				face.Radius*rRate,
				angle
			);
			queue.addFilter(filter);
			
		}
		
		public function RpDescription(face:Face):String
		{
			return "眼睛花了";
		}
	}
}