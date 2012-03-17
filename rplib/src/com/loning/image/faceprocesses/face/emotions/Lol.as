package com.loning.image.faceprocesses.face.emotions
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class Lol extends BaseEmotion
	{
		public function Lol()
		{
			super();
		}
		
		
		override protected function GetMask():Class
		{
			[Embed( 'lol.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "吐吐舌头搞下怪";
		}
		
	}
}