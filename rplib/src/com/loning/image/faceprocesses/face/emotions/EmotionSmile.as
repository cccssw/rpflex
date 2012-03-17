package com.loning.image.faceprocesses.face.emotions
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class EmotionSmile extends ImageMergeFaceProcessor
	{
		public function EmotionSmile()
		{
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x+((face.FaceRectangle.width-ori.width)/2)*0.5,
				face.FaceRectangle.y+((face.FaceRectangle.height-ori.height)/2)*0.6,
				ori.width*1.8,
				ori.height*2);
			return rect;
		}
		
		/*override protected function GetMask():Class
		{
			[Embed( 'smile.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "迷人的微笑"
		}*/
		
	}
}