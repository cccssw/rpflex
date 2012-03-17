package com.sina.microblog.data 
{
	/**
	 * MicroBlogUnread是一个数据封装类(Value Object)， 代表获取当前用户未读消息数
	 * @author Qi Donghui
	 */
	public class MicroBlogUnread
	{
		/**
		 * &#64;我的
		 */
		public var comments:int;
		
		/**
		 * 新评论
		 */
		public var mentions:int;
		
		/**
		 * 新私信
		 */
		public var dm:int;
		
		/**
		 * 新粉丝数
		 */
		public var followers:int;
		
		/**
		 * 是否有新微博的数
		 */
		public var new_status:int;
		
		public function MicroBlogUnread(data:XML) 
		{
			comments = int(data.comments);
			mentions = int(data.mentions);
			dm = int(data.dm);
			followers = int(data.followers);
			if (data.new_status != null) new_status = int(data.new_status);
		}
		
	}

}