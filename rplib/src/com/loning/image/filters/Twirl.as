package com.loning.image.filters
{
	import de.popforge.imageprocessing.core.Image;
	import de.popforge.imageprocessing.filters.IFilter;
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	import flash.display.Shader;
	import flash.filters.ShaderFilter;

	
	public class Twirl extends NativeFilter
	{
		/**
		 * 
		 * @param x
		 * @param y
		 * @param r
		 * @param twirlAngle range 0~360
		 * 
		 */		
		public function Twirl(x:Number,y:Number,r:Number,twirlAngle:Number )
		{
			[Embed("twirl.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var InnerShader:Shader=new Shader(new shaderClass());
			InnerShader.data["center"].value[0]=x;
			InnerShader.data["center"].value[1]=y;
			
			InnerShader.data["radius"].value[0]=r;
			InnerShader.data["twirlAngle"].value[0]=twirlAngle;
			InnerShader.data["gaussOrSinc"].value[0]=0;
			
			this.filter=new ShaderFilter(InnerShader);
			
		}
		
		
	}
}