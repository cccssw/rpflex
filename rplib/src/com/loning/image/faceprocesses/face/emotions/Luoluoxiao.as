package com.loning.image.faceprocesses.face.emotions
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class Luoluoxiao extends BaseEmotion
	{
		public function Luoluoxiao()
		{
			super();
		}
		
		
		override protected function GetMask():Class
		{
			[Embed( 'luoluoxiao.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "笑出了酒窝";
		}
		
	}
}