package com.loning.image.filters
{
	import de.popforge.imageprocessing.filters.NativeFilter;
	
	import flash.filters.BitmapFilter;
	
	public class CustomNativeFilter extends NativeFilter
	{
		public function CustomNativeFilter(filter:BitmapFilter)
		{
			super();
			this.filter=filter;
		}
	}
}