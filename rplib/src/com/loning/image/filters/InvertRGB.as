package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class InvertRGB extends NativeFilter
	{
		public function InvertRGB()
		{
			[Embed("InvertRGB.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var InnerShader:Shader=new Shader(new shaderClass());
			
			this.filter=new ShaderFilter(InnerShader);
		}
	}
}