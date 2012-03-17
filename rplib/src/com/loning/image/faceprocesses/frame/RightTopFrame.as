package com.loning.image.faceprocesses.frame
{
	import com.loning.image.faceprocesses.ImageMergeFaceProcessor;
	import de.popforge.imageprocessing.core.LayerManager;
	import com.loning.image.Face;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import flash.geom.Rectangle;
	
	public class RightTopFrame extends ImageMergeFaceProcessor
	{
		public function RightTopFrame()
		{
			//TODO: implement function
			super();
		}
		
		override public function Process(lm:LayerManager, face:Face):void{
			return;
			
		}
		
		override public function OnProcessed(lm:LayerManager, face:Face, queue:FilterQueue):void{
			this.Merge(lm,face);
		}
		override public function GetRectange(face:Face,ori:Rectangle):Rectangle
		{
			var rect:Rectangle=new Rectangle(
				this.currentLayerManager.width-ori.width,
				0,
				this.currentLayerManager.width,
				this.currentLayerManager.height);
			return rect;
		}
	}
}