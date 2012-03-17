package com.loning.image.faceprocesses.face.emotions
{
	//import com.loning.image.faceprocesses.face.emotions.MaskFaceProcessor;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;

	public class Xieyan extends BaseEmotion
	{
		public function Xieyan()
		{
			super();
		}
		
		
		override protected function GetMask():Class
		{
			[Embed( 'xieyan.png' )]
			var src:Class;
			return src;
		}
		
		override public function RpDescription(face:Face):String
		{
			return "能笑的再傻点么";
		}
		
	}
}