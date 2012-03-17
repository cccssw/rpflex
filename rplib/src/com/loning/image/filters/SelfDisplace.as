package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class SelfDisplace extends NativeFilter
	{
		public function SelfDisplace(center_x:int,center_y:int,stretch_x:int=100,stretch_y:int=100,displacement_x:int=0,displacement_y:int=0)
		{
			[Embed("selfDisplace.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.center.value=[center_x,center_y];
			s.data.stretch.value=[stretch_x,stretch_y];
			s.data.stretch.value=[stretch_x,stretch_y];

			this.filter=new ShaderFilter(s);
		}
	}
}