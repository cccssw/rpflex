package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class Ripple extends NativeFilter
	{
		/**
		 * 
		 * @param x
		 * @param y
		 * @param displacement 
		 * @param size
		 * @param rippleWidth 
		 * @param lightdir_x -1~1
		 * @param lightdir_y -1~1
		 * @param lightbright 0~1
		 * 
		 */
		public function Ripple(x:int,y:int,displacement:Number=10,size:Number=2000,ripplewidth:Number=80,
							   lightdir_x:Number=-0.5,lightdir_y:Number=-0.5,lightbright:Number=0.6)
		{
			[Embed("ripplefilter.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.center.value=[x,y];
			s.data.displacement.value=[displacement];
			s.data.size.value=[size];
			s.data.ripplewidth.value=[ripplewidth];
			s.data.lightdir.value=[lightdir_x,lightdir_y];
			s.data.lightbright.value=[lightbright];
			
			this.filter=new ShaderFilter(s);
		}
	}
}