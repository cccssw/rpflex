package com.sina.microblog.data
{
	/**
	 *	@private
	 *  MicroBlogDataUtil是一个数据封装类(Value Object)，这是一个用于解析数据类型的工具类
	 */ 
	public class MicroBlogDataUtil
	{
		//Tue Dec 15 14:12:50 +0800 2009
		//Flex can parse " Tue Dec 15 14:12:50 GMT+0800 2009
		private static const MONTHS:Object = {Jan:1, Feb:2, Mar:3, Apr:4, May:5, Jun:6, Jul:7, Aug:8, Sep:9, Oct:10, Nov:11, Dec:12};
		
		/**
		 * 这是一个工具类，用于将标识日期时间的字符串转化为Date对象。
		 * 
		 * @param dataStr 标识日期时间的字符串，如"Tue Dec 15 14:12:50 +0800 2009"
		 * 
		 * @return 解析后的Date对象
		 */ 
		public static function resolveDate(dateStr:String):Date
		{
			var time:Date;
			if (dateStr.match(/[a-zA-z]{3} [a-zA-Z]{3} \d{2} \d{2}:\d{2}:\d{2} \+\d{4} \d{4}/g).length == 1 )
			{
				var timePhase:Array = dateStr.split(/[ ]/g);
				timePhase[4] = "GMT" + timePhase[4];
				var timeStr:String = timePhase.join(" ");
				time = new Date();
				time.setTime(Date.parse(timeStr));
			}
			return time;
		}
	}
}