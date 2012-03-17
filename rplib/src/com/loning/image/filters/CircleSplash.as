package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	/**
	 * 半径以外区域径向模糊 
	 * @author Loning
	 * 
	 */
	public class CircleSplash extends NativeFilter
	{
		public function CircleSplash(x:int,y:int,Radius:int)
		{
			[Embed("CircleSplash.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.center.value=[x,y];
			s.data.Radius.value=[Radius];
			
			this.filter=new ShaderFilter(s);
		}
	}
}