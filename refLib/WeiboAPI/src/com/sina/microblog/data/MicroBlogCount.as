package com.sina.microblog.data
{
	/**
	 * MicroBlogCount是一个数据封装类(Value Object)， 代表微博消息的评论和转发数
	 */ 
	
	public class MicroBlogCount
	{
		/**
		 * 微博的id
		 */
		public var id:String;
		
		/**
		 * 微博的评论数
		 */
		public var commentsCount:int;
		/**
		 * 微博转帖的数量
		 */
		public var repostsCount:int;
		
		/**
		 * @private
		 */ 
		public function MicroBlogCount(count:XML)
		{
			id = String(count.id);
			commentsCount = int(count.comments);
			repostsCount = int(count.rt);
		}

	}
}