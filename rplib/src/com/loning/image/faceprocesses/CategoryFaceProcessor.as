package com.loning.image.faceprocesses
{
	import com.gskinner.utils.Rndm;
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	import flash.utils.Dictionary;
	
	public class CategoryFaceProcessor implements IFaceProcessor
	{
		public var Processors:Vector.<IFaceProcessor>;
		public var Index:int;
		public var CategoryItems:Vector.<CategoryItem>;
		public var TotalWeight:int;
		public var IndexCache:Object;
		public function CategoryFaceProcessor()
		{
			IndexCache=new Object();
			
			Processors=new Vector.<IFaceProcessor>();
			CategoryItems=new Vector.<CategoryItem>();
			TotalWeight=0;
		}
		public function AddProcessor(p:IFaceProcessor,item:CategoryItem):void{
			Processors.push(p);
			CategoryItems.push(item);
		}
		public function ClearProcessors():void{
			Processors=new Vector.<IFaceProcessor>();
			CategoryItems=new Vector.<CategoryItem>();
		}
		public function GetIndex(rp:int):int{
			if(IndexCache[rp]==null){
				var arr:Vector.<int>=new Vector.<int>();//记录概率
				var itemIndex:Vector.<int>=new Vector.<int>();//记录原数组位置
				var total:int=0;
				var i:int=0;
				for each(var item:CategoryItem in CategoryItems){
					
					if(item.RpStart<=rp && item.RpEnd>=rp)
					{
						arr.push(item.Weight);
						itemIndex.push(i);
						total+=item.Weight;
					}
					i++;
				}
				var num:int= com.gskinner.utils.Rndm.integer(0,total);
				var count:int=0;
				var index:int=0;
				
				while(num>=count){
					count+=arr[index];
					index++;
				}
				index--;
				IndexCache[rp]=itemIndex[index];
				//trace("计算Index");
			}
			return IndexCache[rp];
		}
		
		public function Process(lm:LayerManager, face:Face):void
		{
			return Processors[GetIndex(face.Rp)].Process(lm,face);
		}
		
		public function OnProcessing(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
			return Processors[GetIndex(face.Rp)].OnProcessing(lm,face,queue);
		}
		
		public function OnProcessed(lm:LayerManager, face:Face, queue:FilterQueue):void
		{
			return Processors[GetIndex(face.Rp)].OnProcessed(lm,face,queue);
		}
		
		public function RpDescription(face:Face):String
		{
			return Processors[GetIndex(face.Rp)].RpDescription(face);
		}
	}
}