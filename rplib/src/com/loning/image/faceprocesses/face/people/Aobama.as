package com.loning.image.faceprocesses.face.people
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class Aobama extends ImageMergeFaceProcessor
	{
		public function Aobama()
		{
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x-ori.width*1.8*0.3,
				face.FaceRectangle.y+(face.FaceRectangle.height)*0.42,
				ori.width*1.8,
				ori.height*2);
			
				
			return rect;
		}
		
		override protected function GetMask():Class
		{
			[Embed( 'aobama.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "奥巴马的热吻"
		}
		
	}
}