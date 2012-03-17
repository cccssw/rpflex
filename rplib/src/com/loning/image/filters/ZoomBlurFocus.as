package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class ZoomBlurFocus extends NativeFilter
	{
		public function ZoomBlurFocus(x:int,y:int,r:int)
		{
			[Embed("ZoomBlurFocus.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.center.value=[x,y];
			s.data.focalSize.value=[r];
			s.data.amount.value=[0.5];

			
			this.filter=new ShaderFilter(s);
		}
	}
}