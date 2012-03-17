package com.loning.image.faceprocesses.face.emotions
{
	import com.loning.image.Face;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	
	public class BaseEmotion extends ImageMergeFaceProcessor
	{
		public function BaseEmotion()
		{
			super();
		}
		
		override public function Process(lm:LayerManager, face:Face):void{
			
			super.Process(lm,face);
			
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			
			var width:int=face.FaceRectangle.width*1.1;
			var height:int=face.FaceRectangle.height;
			var rect:Rectangle=new Rectangle(
				face.FaceRectangle.x+((face.FaceRectangle.width-width)/2)*0.5,
				face.FaceRectangle.y+((face.FaceRectangle.height-height)/2)*0.5 + height*0.2,
				width,
				height);
			return rect;
		}
	}
}