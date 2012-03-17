package com.sina.microblog.utils
{
	import com.adobe.crypto.SHA1;
	
	import flash.system.Capabilities;
	/**
	 * @private
	 * 这是工具类，用于生成一个唯一序列号，在OAuth中使用。
	 */ 
	public class GUID
	{
		private static var count:Number = 0;
		
		public static function createGUID():String
		{
			var now:Date = new Date();
			var p1:Number = now.getTime();
			var p2:Number = Math.random() * Number.MAX_VALUE >> 1;
			var p3:String = Capabilities.serverString;
			var id:String = SHA1.hash(p1+p3+p2+count++).toUpperCase();
			var result:String = id.substring(0, 8) + "-" + id.substring(8, 12) + "-" + id.substring(12, 16) + "-" + id.substring(16, 20) + "-" + id.substring(20, 32);
			return result;
		}
	}
}