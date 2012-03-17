package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class MedianSimple extends NativeFilter
	{
		public function MedianSimple()
		{
			[Embed("MedianSimple.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			this.filter=new ShaderFilter(s);
		}
	}
}