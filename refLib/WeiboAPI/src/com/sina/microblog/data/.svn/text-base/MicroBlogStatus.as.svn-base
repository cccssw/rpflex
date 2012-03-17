package com.sina.microblog.data
{
	/**
	 * MicroBlogStatus是一个数据封装类(Value Object)，该类代表一条微博
	 */ 
	public class MicroBlogStatus
	{
		/**
		 * 当该条微博作为对其他微博的转发时，该属性指向其转发的微博对象
		 */ 
		public var repost:MicroBlogStatus;
		/**
		 * 微博的创建时间
		 */ 
		public var createdAt:Date;
		/**
		 * 微博的ID
		 */ 
		public var id:String;
		/**
		 * 微博的内容
		 */ 
		public var text:String;
		/**
		 * 微博的来源
		 */ 
		public var source:String;
		/**
		 * 标识该条微博是否被收藏
		 */ 
		public var isFavorited:Boolean;
		/**
		 * 标识该条微博是否被裁短
		 */ 
		public var isTruncated:Boolean;
		/**
		 * 回复的status id
		 */ 
		public var inReplyToStatusID:String;
		/**
		 * 回复的用户 id
		 */ 
		public var inReplyToUserID:String;
		/**
		 * 回复的用户昵称
		 */ 
		public var inReplyToScreenName:String;
		/**
		 * 微博附带图片的缩略版本的URL
		 */ 
		public var thumbPicUrl:String;
		/**
		 * 微博附带图片的中等尺寸版本的URL
		 */ 
		public var bmiddlePicUrl:String;
		/**
		 * 微博附带图片的原始尺寸版本的URL
		 */ 
		public var originalPicUrl:String;
		/**
		 * 发出该条微博的用户对象
		 */ 
		public var user:MicroBlogUser;

		/**
		 * @private
		 */ 
		public function MicroBlogStatus(status:XML)
		{
			id = String(status.id);
			createdAt = MicroBlogDataUtil.resolveDate(status.created_at);
			text = status.text;
			source = status.source[0].a.toXMLString();
			isFavorited = status.favorited == "true";
			isTruncated = status.truncated == "true";
			inReplyToStatusID = String(status.in_reply_to_status_id);
			inReplyToUserID = String(status.in_reply_to_user_id);
			inReplyToScreenName = status.in_reply_to_screen_name;
			thumbPicUrl = status.thumbnail_pic;
			bmiddlePicUrl = status.bmiddle_pic;
			originalPicUrl = status.original_pic;
			if ( status.child("user").length() > 0 )
			{
				user = new MicroBlogUser(status.user[0]);
			}
			if ( status.child("retweeted_status").length() > 0 )
			{
				repost = new MicroBlogStatus(status.retweeted_status[0]);
			}
		}
	}
}