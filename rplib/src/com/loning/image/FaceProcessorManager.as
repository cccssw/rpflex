package com.loning.image
{
	import com.gskinner.utils.Rndm;
	
	import de.popforge.imageprocessing.core.Image;
	import de.popforge.imageprocessing.core.ImageFormat;
	import de.popforge.imageprocessing.core.Layer;
	import de.popforge.imageprocessing.core.LayerManager;
	import de.popforge.imageprocessing.filters.FilterQueue;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.*;
	import flash.geom.Rectangle;
	import flash.text.*;
	
	import mx.utils.HSBColor;

	public class FaceProcessorManager
	{
		
		public var Faces:Vector.<Face>;
		public var ProcessedImage:Image;
		
		public var Processors:Vector.<IFaceProcessor>;
		public var FaceLayerManager:LayerManager;
		
		public var ResultText:Vector.<String>;
		
		public var RpWords:String;
		
		public var DrawText:Boolean=true;
		public var DrawRp:Boolean=true;
		[Embed(source="assets/HTOWERT.TTF", fontFamily="EmbedHighTowerText" ,embedAsCFF = false)]
		public var HighTowerText:Class;
		
		public function FaceProcessorManager(image:BitmapData,rpwords:String='')
		{
			this.RpWords=rpwords;
			ResultText=new Vector.<String>();
			var width:int = image.width;
			var height:int =image.height;
			this.ProcessedImage=new Image(width,height,ImageFormat.RGB);
			this.ProcessedImage.loadBitmapData(image.clone());
			FaceLayerManager=new LayerManager(
				width,height,ImageFormat.RGB,this.ProcessedImage);
			Faces=new Vector.<Face>();
			Processors=new Vector.<IFaceProcessor>();
		}
		public function GetResultText():String{
			if( ResultText.length==1){
				return ResultText[0];
			}else{
				var str:String="";
				for(var i:int=0;i<ResultText.length;i++){
					str+=i+":"+ResultText[i]+" ";
				}
				return str;
			}
			return null;
		}
		public function AddProcessor(p:IFaceProcessor):void{
			Processors.push(p);
		}
		public function AddFaces(face:Face):void{
			Faces.push(face);
			ResultText.push("");
		}
		public function ProcessRPImage():void{
			DoProcess();
		}
		protected function DoProcess():void{
			
			var queueBefore: FilterQueue = new FilterQueue();
			var queueAfter: FilterQueue = new FilterQueue();
			var face:Face;
			var p:IFaceProcessor;
			for each(face in Faces){
				for each(p in Processors){
					try{
						p.OnProcessing(
							FaceLayerManager,face,queueBefore);
					}catch(ex:Error){
						trace(ex);
					}
				}
			}
			queueBefore.apply(FaceLayerManager.backgroundImage);
			
			for(var i:int=0;i<Faces.length;i++){
				for each(p in Processors){
					try{
						face=Faces[i];
						p.Process(
							FaceLayerManager,face);
						var text:String=p.RpDescription(face);
						if(text!=null && text!="")
							ResultText[i]+=p.RpDescription(face)+" ";
					}catch(ex:Error){
						trace(ex);
					}
				}
			}
			FaceLayerManager.merge();
			for each(face in Faces){
				for each(p in Processors){
					try{
						p.OnProcessed(
							FaceLayerManager,face,queueAfter);
					}catch(ex:Error){
						trace(ex);
					}
				}
			}
			queueAfter.apply(FaceLayerManager.backgroundImage);
			
		}
		public function ProcessRpWords():void{
			
			if(!DrawText)
				return;
			var color:uint=HSBColor.convertHSBtoRGB(
				(1 - com.gskinner.utils.Rndm.random())*300,
				1,
				1);
			var tf:TextField = new TextField(); 
			tf.text=this.RpWords;
			tf.antiAliasType=AntiAliasType.ADVANCED;
			tf.width=400;
			tf.height=40;
			tf.multiline=true;
			
			var txtFormat:TextFormat = new TextFormat("中易宋体",26,color,true);
			tf.setTextFormat(txtFormat);
			var bitmapdata:BitmapData = new BitmapData(tf.width, tf.height, true,0);
			bitmapdata.draw(tf);
			
			var bitmap:Bitmap=new Bitmap(bitmapdata);
			
			var dropshadow:BitmapFilter=new DropShadowFilter(3,45,0,1,2,2,1,3);
			var bevel:BitmapFilter=new BevelFilter(2,45,0xFFFFFF,0.8,0,0.8,4,4,1,3);
			var glow:BitmapFilter=new GlowFilter(0xFFFFFF,0.6,4,4,2,1,true);
			var filtersArray:Array = new Array(bevel,glow,dropshadow);
			bitmap.filters = filtersArray;
			
			bitmapdata.draw(bitmap);
			var img:Image=Image.fromBitmapData(
				bitmapdata,ImageFormat.RGBA);
			var layer:Layer=new Layer(img,1,"normal",
				50,
				20
			);
			
			FaceLayerManager.addLayer(layer);
			FaceLayerManager.merge();
		}
		public function ProcessRp():void{
			if(!this.DrawRp)
				return;
			for each(var face:Face in Faces){
				var channelName:TextField = new TextField(); 
				channelName.embedFonts=true;
				var color:uint=HSBColor.convertHSBtoRGB(
					(1 - face.Rp / 100)*300,
					1,
					1);
				var rp:String;
				if(face.Rp<10){
					rp="0"+face.Rp.toString();
				}else{
					rp=face.Rp.toString();
				}
				channelName.text=rp;
				channelName.antiAliasType = AntiAliasType.ADVANCED;
				
				channelName.alpha=1.0;
				if(face.Rp==100)
				{
					channelName.width=70;
				}else{
					channelName.width=55;
				}
				channelName.height=60;
				var txtFormat:TextFormat = new TextFormat("EmbedHighTowerText",50,color,true);
				channelName.setTextFormat(txtFormat);
				var bitmapdata:BitmapData = new BitmapData(channelName.width, channelName.height, true,0);
				
				var ystart:int=50;
				bitmapdata.lock();
				for(var x:int=0;x<bitmapdata.width;x++){
					for(var y:int=ystart;y<ystart+3;y++){
						bitmapdata.setPixel32(
							x,y,HSBColor.convertHSBtoRGB(
								(1 - x / bitmapdata.width)*300,
								1,
								1)|0xff000000);
					}
				}
				
				bitmapdata.unlock();
				
				bitmapdata.draw(channelName);
				
				
				var bitmap:Bitmap=new Bitmap(bitmapdata);
				
				var dropshadow:BitmapFilter=new DropShadowFilter(5,45,0,1,4,4,1,3);
				var bevel:BitmapFilter=new BevelFilter(5,45,0xFFFFFF,0.8,0,0.8,4,4,1,3);
				var filtersArray:Array = new Array(dropshadow, bevel); 
				bitmap.filters = filtersArray;
				
				
				bitmapdata.draw(bitmap);
				
				
				
				
				var img:Image=Image.fromBitmapData(
					bitmapdata,ImageFormat.RGBA);
				var layer:Layer=new Layer(img,1,"normal",
					face.FaceRectangle.x+face.FaceRectangle.width,
					face.FaceRectangle.y -  30);
				
				FaceLayerManager.addLayer(layer);
			}
			FaceLayerManager.merge();
		}
	}
}