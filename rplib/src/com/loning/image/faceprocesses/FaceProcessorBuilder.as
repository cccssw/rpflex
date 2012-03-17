package com.loning.image.faceprocesses
{
	import com.loning.image.Face;
	import com.loning.image.IFaceProcessor;
	import com.loning.image.faceprocesses.decoration.DecorationBase;
	import com.loning.image.faceprocesses.face.emotions.BaseEmotion;
	import com.loning.image.faceprocesses.face.glasses.BaseGlass;
	import com.loning.image.faceprocesses.face.masks.MaskFaceProcessor;
	import com.loning.image.faceprocesses.frame.BaseRandomColorFrame;
	import com.loning.image.faceprocesses.frame.BaseSimpleFrame;
	import com.loning.image.faceprocesses.hat.BaseHat;
	import com.loning.image.faceprocesses.hat.BaseToushi;
	import com.loning.image.faceprocesses.random.BaseRandom;
	import com.loning.image.faceprocesses.rightcorner.RightCornerFaceProcessor;
	import com.loning.image.faceprocesses.tongue.BaseTongue;
	
	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;

	public class FaceProcessorBuilder
	{
		public function FaceProcessorBuilder()
		{
		}
		
		public function Create(
			type:String,
			source:BitmapData,
			description:String,
			opacity:Number=1)
		:IFaceProcessor
		{
			var p:ImageMergeFaceProcessor;
			switch(type){
				case 'rightcorner':
					p = new RightCornerFaceProcessor();
					break;
				case 'facemask':
					p = new MaskFaceProcessor();
					break;
				case 'glass':
					p =new BaseGlass();
					break;
				case 'emotion':
					p = new BaseEmotion();
					break;
				case 'decoration':
					p = new DecorationBase();
					break;
				case 'hat':
					p = new BaseHat();
					break;
				case 'random':
					p = new BaseRandom();
					break;
				case 'tongue':
					p = new BaseTongue();
					break;
				case 'simpleframe':
					p = new BaseSimpleFrame();
					break;
				case 'randomcolorframe':
					p = new BaseRandomColorFrame();
					break;
				case 'toushi':
					p =  new BaseToushi();
					break;
				case 'distortempty':
				case 'empty':
					return new EmptyFaceProcessor();
				default:
					var pClass:Class = getDefinitionByName(type) as Class;
					p=new pClass() as ImageMergeFaceProcessor;
					break;
			}
			p.SetConfig(
				source,description,opacity);
			return p;
		}
			
	}
}