package com.loning.image.faceprocesses
{
	import de.popforge.imageprocessing.core.*;
	import com.loning.image.Face;
	import flash.geom.Point;
	import flash.display.BitmapData;

	public class Helper
	{
		public function Helper()
		{
			
		}
		public static function GetFaceImage(lm:LayerManager, face:Face):Image{
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
			return img;
		}
	}
}