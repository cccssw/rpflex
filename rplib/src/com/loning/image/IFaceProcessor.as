package com.loning.image
{
	import de.popforge.imageprocessing.core.Image;
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	import flash.display.Bitmap;

	public interface IFaceProcessor
	{
		function Process(lm:LayerManager,face:Face):void;//进行图层添加
		function OnProcessing(lm:LayerManager,face:Face,queue:FilterQueue):void;//Filters应用到背景图像
		function OnProcessed(lm:LayerManager,face:Face,queue:FilterQueue):void;//Filters应用到整个图像
		function RpDescription(face:Face):String;
	}
}