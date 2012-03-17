package com.loning.image.faceprocesses.face.emotions
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class Laugh extends BaseEmotion
	{
		public function Laugh()
		{
			super();
		}
		
		override protected function GetMask():Class
		{
			[Embed( 'laugh.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "开心笑一笑";
		}
		
	}
}