package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.NativeFilter;
	import com.loning.image.filters.Magnify;
	
	public class ThinChinFaceDistort implements IFaceProcessor
	{
		public function ThinChinFaceDistort()
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
			//瘦下巴
			
			var filter:NativeFilter;
			var rRate:Number=2;
			var dx:Number=face.FaceRectangle.width/3*2;
			var y:Number=face.FaceRectangle.height;
			filter=new Magnify(
				face.Center.x - dx,
				face.FaceRectangle.y+y,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
			
			filter=new Magnify(
				face.Center.x + dx,
				face.FaceRectangle.y+y,
				0,
				face.Radius*rRate);
			queue.addFilter(filter);
		}
		
		public function RpDescription(face:Face):String
		{
			return "瘦下巴";
		}
	}
}