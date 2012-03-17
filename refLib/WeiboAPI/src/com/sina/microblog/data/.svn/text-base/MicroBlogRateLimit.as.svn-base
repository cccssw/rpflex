package com.sina.microblog.data
{
	/**
	 * MicroBlogRateLimit是一个数据封装类(Value Object)，用于返回每小时还剩下的点击数
	 */ 
	public class MicroBlogRateLimit
	{
		/**
		 * 当前时间段(一个小时)还可以发起的请求数.
		 */ 
		public var remainingHits:int;
		/**
		 * 每个小时)允许的请求数.
		 */
		public var hourlyLimit:int;
		
		public function MicroBlogRateLimit(limit:XML)
		{
			remainingHits = int(limit["remaining-hits"]);
			hourlyLimit = int(limit["hourly-limit"]);
		}
	}
}