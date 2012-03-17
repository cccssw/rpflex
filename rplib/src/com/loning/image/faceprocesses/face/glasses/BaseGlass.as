package com.loning.image.faceprocesses.face.glasses
{
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;
	
	public class BaseGlass extends ImageMergeFaceProcessor
	{
		public function BaseGlass()
		{
			//TODO: implement function
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var scale:Number=face.FaceRectangle.width/ori.width ;
			var width:int=ori.width*scale;
			var height:int=ori.height*scale;
			
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x -(width -face.FaceRectangle.width)/2,
				face.LeftEye.y - height/2,
				width,
				height);
			return rect;
		}
		
		/*
		override protected function GetMask():Class
		{
			[Embed( 'mtsc18246.png' )]
			var src:Class;
			return src;
		}*/
	}
}