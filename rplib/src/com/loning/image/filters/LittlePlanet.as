package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class LittlePlanet extends NativeFilter
	{
		/**
		 * 
		 * @param size_x
		 * @param size_y
		 * @param outputSize_x
		 * @param outputSize_y
		 * @param center_x -1~1
		 * @param center_y -1~1
		 * @param longitude 0~360
		 * @param latitude 0~360
		 * @param rotate 0~360
		 * @param zoom 0~1
		 * @param wrap -2~2
		 * @param twist -1~1
		 * @param bulge -1~1
		 * 
		 */
		public function LittlePlanet(
			size_x:int,
			size_y:int,
			
			outputSize_x:int,
			outputSize_y:int,
			
			center_x:Number=0,
			center_y:Number=0,
			
			longitude:int = 0,
			latitude:int = 90,
			
			rotate:int=0,
			zoom:Number=0.4,
			
			wrap:Number=0,
			twist:Number=0,
			bulge:Number=0
		)
		{
			[Embed("littleplanet.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			trace(s.data.size);
			s.data.size.value=[size_x,size_y];
			s.data.outputSize.value=[outputSize_x,outputSize_y];
			s.data.center.value=[center_x,center_y];
			
			s.data.longitude.value=[longitude];
			s.data.latitude.value=[latitude];
			s.data.rotate.value=[rotate];
			
			s.data.zoom.value=[zoom];
			s.data.wrap.value=[wrap];
			s.data.twist.value=[twist];
			s.data.bulge.value=[bulge];
			
			this.filter=new ShaderFilter(s);
		}
	}
}