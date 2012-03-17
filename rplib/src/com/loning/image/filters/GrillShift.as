package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	/**
	 * 横向的格子分裂 
	 * @author Loning
	 * 
	 */
	public class GrillShift extends NativeFilter
	{
		public function GrillShift(grillSize:int,offset:int)
		{
			super();
			[Embed("Grill shift.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var InnerShader:Shader=new Shader(new shaderClass());
			InnerShader.data.grillSize.value=[grillSize];
			InnerShader.data.offset.value=[offset];
			
			this.filter=new ShaderFilter(InnerShader);
		}
	}
}