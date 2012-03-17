package com.loning.image.faceprocesses.tongue
{
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import com.loning.image.Face;
	import flash.geom.Rectangle;
	
	public class BaseTongue extends ImageMergeFaceProcessor
	{
		public function BaseTongue()
		{
			//TODO: implement function
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var scale:Number=face.FaceRectangle.width/ori.width * 0.5 ;
			var width:int=ori.width*scale;
			var height:int=ori.height*scale;
			
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x -(width -face.FaceRectangle.width)/2,
				face.Mouth.y - height/2 + face.FaceRectangle.height*0.05 ,
				width,
				height);
			return rect;
		}
		/*
		override protected function GetMask():Class
		{
			[Embed( 'mtsc20847.png' )]
			var src:Class;
			return src;
		}*/
		
	}
}