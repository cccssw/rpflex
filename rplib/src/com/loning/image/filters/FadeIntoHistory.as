package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.filters.ShaderFilter;
	import flash.display.Shader;
	
	public class FadeIntoHistory extends NativeFilter
	{
		public function FadeIntoHistory()
		{
			[Embed("fade_into_history2.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.crossfade.value=[2];
			this.filter=new ShaderFilter(s);
		}
	}
}