package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	/**
	 *放大镜 
	 * @author Loning
	 * 
	 */
	public class Magnify extends NativeFilter
	{
		/**
		 * 
		 * @param x
		 * @param y
		 * @param innerRadius 内半径
		 * @param outerRadius 外半径
		 * @param magnification 0～50，5就挺好
		 * 
		 */
		public function Magnify(x:int,y:int,innerRadius:int=0,outerRadius:int=10,magnification:int = 4)
		{
			[Embed("magnify.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			trace("x:"+x);
			trace("y:"+y);
			s.data.center.value=[x,y];
			s.data.innerRadius.value=[innerRadius];
			s.data.outerRadius.value=[outerRadius];
			s.data.magnification.value=[magnification];
			this.filter=new ShaderFilter(s);
		}
		
	}
}