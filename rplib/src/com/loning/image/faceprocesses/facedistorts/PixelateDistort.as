package com.loning.image.faceprocesses.facedistorts
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.*;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.noise.Pixelate;
	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	public class PixelateDistort implements IFaceProcessor
	{
		public function PixelateDistort()
		{
		}
		
		public function Process(lm:LayerManager, face:Face):void
		{
			var filter: Pixelate = new Pixelate(8);
			var bitmapdata:BitmapData=new BitmapData(
				face.FaceRectangle.width,
				face.FaceRectangle.height,
				true,
				0);
			
			bitmapdata.copyPixels(
				lm.bitmapData,
				face.FaceRectangle,
				new Point());
			
			var img:Image=Image.fromBitmapData(
				bitmapdata,ImageFormat.RGBA);
			
			filter.apply(img);
			lm.addLayer(
				new Layer(
					img,1,"normal",
					face.FaceRectangle.x,
					face.FaceRectangle.y
				));
		}
		
		public function OnProcessing(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
		}
		
		public function OnProcessed(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
		}
		
		public function RpDescription(face:Face):String
		{
			return "听说你拍片去了?";
		}
	}
}