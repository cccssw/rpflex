package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.filters.ShaderFilter;
	import flash.display.Shader;
	
	public class ColorSeparator extends NativeFilter
	{
		public function ColorSeparator(orx:Number,ory:Number,ogx:Number,ogy:Number,obx:Number,oby:Number)
		{
			[Embed("ColorSeparator.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.or.value=[orx,ory];
			s.data.og.value=[ogx,ogy];
			s.data.ob.value=[obx,oby];
			
			this.filter=new ShaderFilter(s);
		}
	}
}