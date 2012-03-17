package com.loning.image.faceprocesses.face.emotions
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class Laughteeth extends BaseEmotion
	{
		public function Laughteeth()
		{
			super();
		}
		
		
		override protected function GetMask():Class
		{
			[Embed( 'laughteeth.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "笑出了酒窝";
		}
		
	}
}