package com.sina.microblog.data
{
	
	/**
	 * MicroBlogDirectMessage是一个数据封装类(Value Object)，该类代表一条私信
	 */ 	
	public class MicroBlogDirectMessage
	{
		/**
		 * 私信的创建时间
		 */ 
		public var createdAt:Date;
		/**
		 * 私信的id
		 */ 
		public var id:String;
		/**
		 * 私信的内容
		 */ 
		public var text:String;
		/**
		 * 私信发送者的ID
		 */  
		public var senderID:String;
		/**
		 * 私信接收者的ID
		 */ 
		public var recipientID:String;
		/**
		 * 私信发送者的昵称
		 */  
		public var senderScreenName:String;
		/**
		 * 私信接收者的昵称
		 */ 
		public var recipientScreenName:String;
		/**
		 * 私信发送者
		 */ 
		public var sender:MicroBlogUser;
		/**
		 * 私信接收者
		 */ 
		public var recipient:MicroBlogUser;
		
		/**
		 * @private
		 */ 
		public function MicroBlogDirectMessage(message:XML)
		{
			id = String(message.id);
			createdAt = MicroBlogDataUtil.resolveDate(message.created_at);
			text = message.text;
			senderID = String(message.sender_id);
			recipientID = String(message.recipient_id);
			senderScreenName = message.sender_screen_name;
			recipientScreenName = message.recipient_screen_name;
			sender = new MicroBlogUser(message.sender[0]);
			recipient = new MicroBlogUser(message.recipient[0]);
		}

	}
}