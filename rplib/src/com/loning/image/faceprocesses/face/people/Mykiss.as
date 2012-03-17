package com.loning.image.faceprocesses.face.people
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class Mykiss extends ImageMergeFaceProcessor
	{
		public function Mykiss()
		{
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x+face.FaceRectangle.width*0.4,
				face.FaceRectangle.y-(face.FaceRectangle.height)*0.3,
				ori.width*1.8,
				ori.height*1.8);
			return rect;
		}
		
		override protected function GetMask():Class
		{
			[Embed( 'mykiss.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "Kiss kiss!"
		}
		
	}
}