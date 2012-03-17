package com.loning.image.faceprocesses.necklace
{
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import com.loning.image.Face;
	import flash.geom.Rectangle;
	
	public class BaseNecklace extends ImageMergeFaceProcessor
	{
		public function BaseNecklace()
		{
			//TODO: implement function
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var scale:Number=face.FaceRectangle.width/ori.width *0.7 ;
			var width:int=ori.width*scale;
			var height:int=ori.height*scale;
			
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x -(width -face.FaceRectangle.width)/2,
				face.FaceRectangle.y+face.FaceRectangle.height*1.1,
				width,
				height);
			return rect;
		}
		
	}
}