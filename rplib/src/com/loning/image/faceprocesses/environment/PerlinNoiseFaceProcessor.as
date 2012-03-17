package com.loning.image.faceprocesses.environment
{
	import com.loning.image.Face;
	import com.loning.image.faceprocesses.Helper;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	import de.popforge.imageprocessing.core.Image;
	import de.popforge.imageprocessing.filters.noise.PerlinNoise;
	
	public class PerlinNoiseFaceProcessor implements IFaceProcessor
	{
		public function PerlinNoiseFaceProcessor()
		{
		}
		
		public function Process(lm:LayerManager, face:Face):void
		{
			//var img:Image=Helper.GetFaceImage(lm,face);
			
		}
		
		public function OnProcessing(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
			
		}
		
		public function OnProcessed(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
			var filter: PerlinNoise = new PerlinNoise( 25*(1-face.RpRate), 25*(1-face.RpRate), 10 );
			
			queue.addFilter(filter);
		}
		
		public function RpDescription(face:Face):String
		{
			return "有幸变成阿凡达去潘多拉玩~";
		}
	}
}