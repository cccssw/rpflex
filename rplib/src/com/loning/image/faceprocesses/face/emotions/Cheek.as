package com.loning.image.faceprocesses.face.emotions
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class Cheek extends BaseEmotion
	{
		public function Cheek()
		{
			super();
		}
		
		override protected function GetMask():Class
		{
			[Embed( 'cheek.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "牙敢不敢多露点呀～";
		}
		
	}
}