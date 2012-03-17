package com.loning.image.faceprocesses.face.masks
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.Image;
	import de.popforge.imageprocessing.core.ImageFormat;
	import de.popforge.imageprocessing.core.Layer;
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	
	import mx.core.BitmapAsset;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	
	public class MaskFaceProcessor extends ImageMergeFaceProcessor
	{
		
		public function MaskFaceProcessor()
		{
			super();
			opacity=0.5;
		}
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var scale:Number=face.FaceRectangle.width/ori.width * 1.4;
			var width:int=ori.width*scale;
			var height:int=ori.height*scale;
			
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x -(width -face.FaceRectangle.width)/2,
				face.FaceRectangle.y -(height -  face.FaceRectangle.height)/2,
				width,
				height);
			return rect;
		}
		
	}
}