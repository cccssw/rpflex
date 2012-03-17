package com.loning.image.faceprocesses.hat
{
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import com.loning.image.Face;
	import flash.geom.Rectangle;
	import com.gskinner.utils.Rndm;
	
	public class BaseToushi extends ImageMergeFaceProcessor
	{
		public function BaseToushi()
		{
			//TODO: implement function
			super();
		}
		
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var scale:Number=face.FaceRectangle.width/ori.width * (1-com.gskinner.utils.Rndm.random()*0.6);
			var width:int=ori.width*scale;
			var height:int=ori.height*scale;
			
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x+(face.FaceRectangle.width-width)*com.gskinner.utils.Rndm.random(),
				face.FaceRectangle.y-height+face.FaceRectangle.height*0.1,
				width,
				height);
			return rect;
		}
		
	}
	
}