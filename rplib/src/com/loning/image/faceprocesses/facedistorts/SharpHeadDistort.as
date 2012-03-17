package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.NativeFilter;
	import com.loning.image.filters.Magnify;
	
	public class SharpHeadDistort implements IFaceProcessor
	{
		public function SharpHeadDistort()
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
			//尖头
			
			var filter:NativeFilter;
			var rRate:Number=1.5;
			var dx:Number=face.FaceRectangle.width/2;
			var dy:Number=face.FaceRectangle.height/3;
			filter=new Magnify(
				face.Center.x - dx,
				face.Center.y - dy,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
			
			filter=new Magnify(
				face.Center.x + dx,
				face.Center.y - dy,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
			
		}
		
		public function RpDescription(face:Face):String
		{
			return "尖脑袋怪";
		}
	}
}