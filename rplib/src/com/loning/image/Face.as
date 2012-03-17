package com.loning.image
{
	import com.gskinner.utils.Rndm;
	
	import de.popforge.imageprocessing.core.Image;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	public class Face
	{
		
		public var FaceRectangle:Rectangle;
		public var FaceImage:Image;
		public var Center:Point;
		
		public var Rp:int;
		public var Radius:int;
		public var RpRate:Number;
		public var Mouth:Point;
		public var LeftEye:Point;
		public var RightEye:Point;
		public var Norse:Point;
		public function Face(rect:Rectangle,face:Image,rp:int=-1)
		{
			FaceRectangle=rect;
			Center=new Point(
				rect.x+rect.width/2,
				rect.y+rect.height/2);
			Radius=rect.width/2;
			FaceImage=face;
			if(rp==-1)
				Rp=com.gskinner.utils.Rndm.integer(0,101);
			else
				Rp=rp;
			RpRate=(100-Rp)/100;
			Mouth=new Point(Center.x,Center.y+rect.height*0.4);
			Norse=new Point(
				Center.x,
				Center.y+rect.height*0.1);
			LeftEye=new Point(
				Center.x - rect.width*0.21,
				Center.y - rect.height*0.10);
			RightEye=new Point(
				Center.x + rect.width*0.21,
				Center.y - rect.height*0.10);
		}
		public function GenRandomFacePoint():Point{
			var p:Point = new Point(
				Center.x+(com.gskinner.utils.Rndm.random()-0.5)*FaceRectangle.width,
				Center.y + (com.gskinner.utils.Rndm.random()-0.5)*FaceRectangle.height);
			return p;
		}
		
		public function GetFaceByRectangle(rect:Rectangle):BitmapData{
			var bitmapdata:BitmapData=new BitmapData(
				rect.width,
				rect.height,
				true,
				0);
			bitmapdata.copyPixels(
				this.FaceImage.bitmapData,
				rect,
				new Point());
			return bitmapdata;
		}
		
		public function GetFace(scalex:Number=1,scaley:Number=1):BitmapData{
			var bitmapdata:BitmapData;
			if(scalex==1 && scaley==1){
				bitmapdata=this.GetFaceByRectangle(this.FaceRectangle);
			}else{
				this.GetFaceByRectangle(
					this.GetFaceRectangle(scalex,scaley)
				);
			}
			return bitmapdata;
		}
		
		public function GetFaceRectangle(scalex:Number=1,scaley:Number=1):Rectangle{
			if(scalex==1 && scaley==1)
				return this.FaceRectangle;
			var dx:int=this.FaceRectangle.width*(scalex-1)/2;
			var dy:int=this.FaceRectangle.height*(scaley-1)/2;
			var rect:Rectangle=this.FaceRectangle.clone();
			rect.inflate(dx,dy);
			//trace(dx,dy);
			
			if(rect.width>this.FaceImage.width){
				rect.x=0;
				rect.width=this.FaceImage.width;
			}
			if(rect.height>this.FaceImage.height){
				rect.y=0;
				rect.height=this.FaceImage.height;
			}
			return rect;
		}
		
		
		
	}
}