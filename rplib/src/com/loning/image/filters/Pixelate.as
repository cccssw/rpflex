package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class Pixelate extends NativeFilter
	{
		public function Pixelate(d:int)
		{
			[Embed("pixelate.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.dimension.value=[d];

			this.filter=new ShaderFilter(s);
		}
	}
}