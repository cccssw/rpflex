package com.loning.image.faceprocesses.random
{
	import com.gskinner.utils.Rndm;
	import com.loning.image.Face;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	
	import flash.geom.Rectangle;

	public class BaseRandom extends ImageMergeFaceProcessor
	{
		public function BaseRandom()
		{
			super();
		}
		
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var rect:Rectangle;
			
			var facerect:Rectangle=face.FaceRectangle.clone();
			facerect.inflate(facerect.width/4,facerect.height/4);
			
			if(facerect.width>=face.FaceImage.width &&
				facerect.height>=face.FaceImage.height){
				return new Rectangle();
			}
			var r1:Rectangle=new Rectangle(
				0,0,this.currentLayerManager.width,facerect.y);
			
			var r2:Rectangle=new Rectangle(
				0,0,facerect.x,this.currentLayerManager.height);
			
			var r3:Rectangle=new Rectangle(
				0,
				facerect.y+facerect.height,
				this.currentLayerManager.width,
				this.currentLayerManager.height-facerect.y-facerect.height);
			
			var r4:Rectangle=new Rectangle(
				facerect.x+facerect.width,
				0,
				this.currentLayerManager.width-facerect.x-facerect.width,
				this.currentLayerManager.height);
			
			var arr:Vector.<Rectangle>=new Vector.<Rectangle>();
			arr.push(r1,r2,r3,r4);
			
			arr = arr.sort(function taxis(element1:*,element2:*):int{
				
				var num:Number=Rndm.random();
				if(num<0.5){
					return -1;
				}else{
					return 1;
				}
			});
			var w:int=ori.width;
			var h:int=ori.height;
			
			while(rect==null){
				for each(var r:Rectangle in arr){
					if(r.width>=w && r.height>=h){
						rect=new Rectangle(
							r.x+Rndm.random()*(r.width-w),
							r.y+Rndm.random()*(r.height-h),
							w,
							h);
					}
				}
				if(rect==null){
					w/=2;
					h/=2;
				}
			}
			return rect;
		}
		
	}
}