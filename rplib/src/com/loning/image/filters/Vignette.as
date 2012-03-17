package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class Vignette extends NativeFilter
	{
		/**
		 * 
		 * @param width
		 * @param height
		 * @param amount
		 * @param radius
		 * 
		 */
		public function Vignette(width:int,height:int,amount:Number=1,radius:Number=2.5)
		{
			[Embed("vignette.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.size.value=[width,height];
			s.data.amount.value=[amount];
			s.data.radius.value=[radius];
			
			
			this.filter=new ShaderFilter(s);
		}
	}
}