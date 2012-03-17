package com.sina.microblog.data
{
	/**
	 * MicroBlogRelationshipDescriptor是一个数据封装类(Value Object)，用于描述用户关系，在MicroBlogUsersRelationship中应用
	 */ 
	public class MicroBlogRelationshipDescriptor
	{
		/**
		 * 用户的uid
		 */ 
		public var id:String;
		/**
		 * 用户的昵称
		 */
		public var screenName:String;
		/**
		 * 用户是否关注我
		 */
		public var isFollowingMe:Boolean;
		/**
		 * 用户是否被关注
		 */
		public var isFollowedBy:Boolean;
		/**
		 * 是否允许通知
		 */
		public var isNotificationEnabled:Boolean;
		
		public function MicroBlogRelationshipDescriptor(user:XML)
		{
			id = String(user.id);
			screenName = user.screen_name;
			isFollowingMe = user.following == "true";
			isFollowedBy = user.followed_by == "true";
			isNotificationEnabled = user.notification_enabled == "true";
		}
	}
}