package com.loning.image
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.lazyloaders.LazyJSONLoader;
	
	import com.loning.image.faceprocesses.CategoryFaceProcessor;
	import com.loning.image.faceprocesses.CategoryItem;
	import com.loning.image.faceprocesses.EmptyCategoryFaceProcessor;
	import com.loning.image.faceprocesses.FaceProcessorBuilder;
	import com.loning.image.faceprocesses.RpFaceProcessor;
	import com.loning.image.faceprocesses.environment.EnvironmentFaceCategory;
	import com.loning.image.faceprocesses.face.FacesFaceCategory;
	import com.loning.image.faceprocesses.face.glasses.BaseGlass;
	import com.loning.image.faceprocesses.facedistorts.FaceDistortCategory;
	import com.loning.image.faceprocesses.frame.BaseRandomColorFrame;
	import com.loning.image.faceprocesses.frame.BaseSimpleFrame;
	import com.loning.image.faceprocesses.hat.BaseToushi;
	import com.loning.image.faceprocesses.hat.HatFaceCategory;
	import com.loning.image.faceprocesses.necklace.BaseNecklace;
	import com.loning.image.faceprocesses.random.RandomFaceCategory;
	import com.loning.image.faceprocesses.tongue.BaseTongue;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.Dictionary;
	
	public class RpFaceProcessorManager extends FaceProcessorManager
	{
		protected var ctgDic:Dictionary;
		
		public var faceUserInfo:FaceUserInfo;
		protected var lazy : BulkLoader;
		protected var theFinal:Boolean;
		public function RpFaceProcessorManager(image:BitmapData,
											   faceUserInfo:FaceUserInfo,
											   lazy : BulkLoader,
											   theFinal:Boolean=false,
											   rpwords:String='',
											   drawText:Boolean=true)
		{
			//TODO: implement function
			super(image, rpwords);
			
			this.faceUserInfo	= faceUserInfo;
			this.lazy			= lazy;
			this.theFinal		= theFinal;
			this.DrawText		= drawText;
			
			this.ctgDic			= new Dictionary();
			
			AddProcessor(new RpFaceProcessor());
			
			
			AddCategoryProcessor(new RandomFaceCategory(),'random1');
			AddCategoryProcessor(new RandomFaceCategory(),'random2');
			AddCategoryProcessor(new RandomFaceCategory(),'random3');
			
			AddCategoryProcessor(new HatFaceCategory(),'hat');
			AddCategoryProcessor(new EmptyCategoryFaceProcessor(500),'tongue');
			AddCategoryProcessor(new FacesFaceCategory(),'face');
			
			AddCategoryProcessor(
				new EmptyCategoryFaceProcessor(),'frame');
			
			FillRemoteElements();
			
			AddProcessor(new EnvironmentFaceCategory());
		}
		
		public function AddCategoryProcessor(
			p:CategoryFaceProcessor,
			ctg:String):void
		{
			ctgDic[ctg]=p;
			AddProcessor(p);
		}
		
		protected function FillRemoteElements():void{
			var builder:FaceProcessorBuilder=new FaceProcessorBuilder();
			for(var i:int = 0;i<faceUserInfo.elements.length;i++){
				var e:FaceElement=faceUserInfo.elements[i];
				var p:CategoryFaceProcessor=this.ctgDic[e.ctg] as CategoryFaceProcessor;
				if(p==null){
					if(e.ctg=="facedistort"){
						trace("create facedistort category");
						p=new FaceDistortCategory();
					}else{
						p=new CategoryFaceProcessor();
					}
					this.AddCategoryProcessor(
						p,e.ctg);
				}
				try{
					
				var bmp:BitmapData=lazy.getBitmapData(e.id);
		
				p.AddProcessor(
					builder.Create(
						e.type,
						bmp,
						e.des),
					new CategoryItem(
						e.weight,
						e.rps,
						e.rpe));
				}catch(ex:Error){
					trace(ex);
				}
			}
			CheckLuckDog();
		}
		protected function CheckLuckDog():void{
			if(this.theFinal && this.faceUserInfo.luckyDog!=''){
				var e:FaceElement;
				for(var i:int = 0;i<faceUserInfo.elements.length;i++)
					if(faceUserInfo.elements[i].id==this.faceUserInfo.luckyDog)
					{
						e=faceUserInfo.elements[i];
						break;
					}
				var p:CategoryFaceProcessor=this.ctgDic[e.ctg] as CategoryFaceProcessor;
				p.ClearProcessors();
				var builder:FaceProcessorBuilder=new FaceProcessorBuilder();
				p.AddProcessor(
					builder.Create(
						e.type,
						lazy.getBitmapData(e.id),
						e.des),
					new CategoryItem(
						100,
						0,
						100));
			}
		}
	}
}