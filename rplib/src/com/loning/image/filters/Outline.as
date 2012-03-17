package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class Outline extends NativeFilter
	{
		public function Outline(difference_1:Number=0.1,difference_2:Number=0.01)
		{
			[Embed("outline.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.difference.value=[difference_1,difference_2];

			this.filter=new ShaderFilter(s);
		}
	}
}