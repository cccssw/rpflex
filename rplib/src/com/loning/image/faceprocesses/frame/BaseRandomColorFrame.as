package com.loning.image.faceprocesses.frame
{
	import com.loning.image.Face;
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	
	public class BaseRandomColorFrame extends ImageMergeFaceProcessor
	{
		public function BaseRandomColorFrame()
		{
			//TODO: implement function
			super();
			
			
			
		}
		
		override public function Process(lm:LayerManager, face:Face):void{
			return;
			
		}
		
		override public function OnProcessed(lm:LayerManager, face:Face, queue:FilterQueue):void{
			this.colorTransform=new ColorTransform(1,1,1,1,
				Math.random()*255,Math.random()*255,Math.random()*255,0);
			this.Merge(lm,face);
			
		}
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var rect:Rectangle=new Rectangle(
				0,
				0 ,
				this.currentLayerManager.width,
				this.currentLayerManager.height);
			return rect;
		}
		/*
		override protected function GetMask():Class
		{
			[Embed( 'kuang_sibian(16).png' )]
			var src:Class;
			return src;
		}
		*/
		
	}
}