package com.loning.image.faceprocesses.rightcorner
{
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;
	
	public class RightCornerFaceProcessor extends ImageMergeFaceProcessor
	{
		public function RightCornerFaceProcessor()
		{
			super();
		}
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var height:int=ori.height;
			if(height>face.FaceRectangle.height/2.5)
				height=face.FaceRectangle.height/2.5;
			var width:int=height/ori.height*ori.width;
			var dx:int=width/2;
			if(dx>face.FaceRectangle.width/4)
				dx=face.FaceRectangle.width/4;
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x+face.FaceRectangle.width - width/2,
				face.FaceRectangle.y+face.FaceRectangle.height-height,
				width,
				height);
			return rect;
		}
	}
}