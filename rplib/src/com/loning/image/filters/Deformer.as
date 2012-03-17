package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class Deformer extends NativeFilter
	{
		/**
		 * 把图像很怪异的扭曲
		 * @param center_x
		 * @param center_y
		 * @param imageHeight
		 * @param stretch 1~3
		 * 
		 */
		public function Deformer(center_x:int,center_y:int,imageHeight:int,stretch:int)
		{
			[Embed("deformer.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.center_x.value=[center_x];
			s.data.center_y.value=[center_y];
			s.data.imageHeight.value=[imageHeight];
			s.data.stretch.value=[stretch];
			this.filter=new ShaderFilter(s);
		}
	}
}