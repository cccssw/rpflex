package com.loning.image.faceprocesses
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.*;
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import mx.core.BitmapAsset;
	
	import spark.primitives.Rect;
	import flash.geom.ColorTransform;
	
	public class ImageMergeFaceProcessor implements IFaceProcessor
	{
		//private var cacheSrc:Class;
		
		protected var cachedSource:BitmapData;
		protected var blenMode:String="normal";
		protected var opacity:Number=1;
		protected var description:String;
		
		protected var currentLayerManager:LayerManager;
		
		protected var colorTransform:ColorTransform=null;
		
		public function ImageMergeFaceProcessor(){
			
		}
		
		public function SetConfig(
			source:BitmapData=null,
			description:String=null,
			opacity:Number=-1):void
		{
			this.cachedSource=source;
			if(source==null)
			{
				throw new Error('god');
			}
			this.description=description;
			if(opacity>0)
				this.opacity=opacity;
		}
		
		public function Process(lm:LayerManager, face:Face):void
		{
			this.Merge(lm,face);
		}
		
		protected function Merge(lm:LayerManager, face:Face):void{
			currentLayerManager=lm;
			var rect:Rectangle=face.FaceRectangle;
			var source:BitmapData=
				cachedSource==null?
				(cachedSource=this.GetImage()):cachedSource;
			var objrect:Rectangle=this.GetRectange(face,source.rect);
			
			var width:int=objrect.width;
			var height:int=objrect.height;
			var bitmapdata:BitmapData=new BitmapData(
				width,height,true,0x0);
			var m:Matrix=new Matrix();
			
			m.scale(width/source.width,height/source.height);
			bitmapdata.draw(source,m,this.colorTransform,null,null,true);
			
			var img:Image=Image.fromBitmapData(
				bitmapdata,ImageFormat.RGBA);
			var layer:Layer=new Layer(img,this.opacity,this.blenMode,
				objrect.x,
				objrect.y);
			lm.addLayer(layer);
		}
		
		public function OnProcessing(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
		}
		
		public function OnProcessed(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
		}
		
		public function GetRectange(face:Face,ori:Rectangle):Rectangle{
			return null;
		}
		
		public function RpDescription(face:Face):String
		{
			return this.description;
		}
		
		protected function GetMask():Class
		{
			return null;
		}
		
		protected function GetImage():BitmapData{
			
			var cls:Class= GetMask();
			var a:BitmapAsset =new cls();
			return a.bitmapData;
		}
		
	}
}