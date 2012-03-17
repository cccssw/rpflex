package com.sina.microblog.data
{
	
	/**
	 * MicroBlogComment是一个数据封装类(Value Object)，该类代表对一条微博的评论
	 */ 	
	public class MicroBlogComment
	{
		/**
		 *  创建评论的时间
		 */  	
		public var createdAt:Date;
		/**
		 * 评论的id
		 */ 
		public var id:String;
		
		/**
		 * 评论的内容
		 */ 
		public var text:String;
		/**
		 * 评论的作者
		 */ 
		public var user:MicroBlogUser;
		/**
		 * 该条评论所针对的微博
		 */ 
		public var status:MicroBlogStatus;
		/**
		 * 该条评论所针对的微博回复
		 */ 
		public var replyComments:Array;

		/**
		 * @private
		 */ 
		public function MicroBlogComment(comment:XML)
		{
			id = String(comment.id);
			createdAt = MicroBlogDataUtil.resolveDate(comment.created_at);
			text = comment.text;
			if(comment.user[0] !=null) user = new MicroBlogUser(comment.user[0]);
			
			if ( comment.child("status").length() > 0 )
			{
				status = new MicroBlogStatus(comment.status[0]);
			}
			var len:int = comment.child("reply_comment").length();
			if ( len > 0 )
			{
				var replyComment:MicroBlogComment;
				replyComments = [];
				for ( var i:int = 0; i < len; ++i )
				{
					replyComment = new MicroBlogComment(comment.reply_comment[i]);
					replyComments.push(replyComment);
				}
			}	
		}

	}
}