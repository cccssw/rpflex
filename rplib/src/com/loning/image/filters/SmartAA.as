package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class SmartAA extends NativeFilter
	{
		public function SmartAA(width:int,height:int)
		{
			[Embed("SmartAA.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.A_width.value=[width];
			s.data.B_height.value=[height];
			
			
			this.filter=new ShaderFilter(s);
		}
	}
}