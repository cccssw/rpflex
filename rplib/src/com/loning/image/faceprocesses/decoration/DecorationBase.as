package com.loning.image.faceprocesses.decoration
{
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import flash.geom.Rectangle;
	import com.loning.image.Face;
	import com.gskinner.utils.Rndm;
	
	public class DecorationBase extends ImageMergeFaceProcessor
	{
		public function DecorationBase()
		{
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var rect:Rectangle;
			rect=new Rectangle(
				face.FaceRectangle.x*(1 + com.gskinner.utils.Rndm.random()*0.1)-ori.width,
				face.FaceRectangle.y*(1 - (com.gskinner.utils.Rndm.random()-1)*0.5)+face.FaceRectangle.height-ori.height,
				ori.width,
				ori.height);
			return rect;
		}
	}
}