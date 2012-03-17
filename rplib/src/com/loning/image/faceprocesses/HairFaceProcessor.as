package com.loning.image.faceprocesses
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.filters.IFilter;
	import de.popforge.imageprocessing.filters.distortion.Twirl;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.net.FileFilter;
	
	public class HairFaceProcessor implements IFaceProcessor
	{
		public function HairFaceProcessor()
		{
			super();
		}
		public function Process(lm:LayerManager,face:Face):void{
			
		}
		public function OnProcessing(lm:LayerManager,face:Face,queue:FilterQueue):void{
			
			queue.addFilter(
				new Twirl(
					face.Center.x,
					face.Center.y,
					(100-face.Rp)/100*3.14*2,100-face.Rp));
		}
		public function OnProcessed(lm:LayerManager,face:Face,queue:FilterQueue):void{
			
		}
		public function RpDescription(face:Face):String{
			return "";
		}
	}
}