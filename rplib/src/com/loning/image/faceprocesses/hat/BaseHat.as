package com.loning.image.faceprocesses.hat
{
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;
	
	public class BaseHat extends ImageMergeFaceProcessor
	{
		public function BaseHat()
		{
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var scale:Number=face.FaceRectangle.width/ori.width * 1.4;
			var width:int=ori.width*scale;
			var height:int=ori.height*scale;
			
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x+(face.FaceRectangle.width-width)/2,
				face.FaceRectangle.y-height+face.FaceRectangle.height*0.3,
				width,
				height);
			return rect;
		}
		
	}
}