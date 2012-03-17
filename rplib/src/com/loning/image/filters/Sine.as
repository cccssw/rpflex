package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	public class Sine extends NativeFilter
	{
		/**
		 * 
		 * @param frequency 0~1
		 * @param waveSize -50~50
		 * @param direction 0 or 1
		 * 
		 */
		public function Sine(frequency:Number,waveSize:int,direction:int)
		{
			[Embed("sine.pbj",mimeType="application/octet-stream")]
			var shaderClass:Class;
			var s:Shader=new Shader(new shaderClass());
			s.data.frequency.value=[frequency];
			s.data.waveSize.value=[waveSize];
			s.data.direction.value=[direction];
			this.filter=new ShaderFilter(s);
		}
	}
}