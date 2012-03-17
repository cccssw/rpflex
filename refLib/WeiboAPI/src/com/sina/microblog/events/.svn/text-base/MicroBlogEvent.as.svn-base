package com.sina.microblog.events
{
	import flash.events.Event;

	/**
	 * 所有对新浪微博API的请求会以事件的形式返回给调用者.当API请求正常返回时，MicroBlog类会派发MicroBlogEvent事件.
	 * 
	 * <p>每个MicroBlogEvent事件都有一个result属性用于保存响应的数据。</br>
	 * API请求与事件的对应关系请参照MicroBlog类的文档。</p>
	 * 
	 * @see com.sina.microblog.MicroBlog
	 */ 
	public class MicroBlogEvent extends Event
	{
		public static const LOGIN_RESULT:String = "loginResult";
		
		public static const ANYWHERE_TOKEN_RESULT:String = "anywhereTokenResult";
		public static const OAUTH_REQUEST_USER_APPROVE:String = "oauthRequestUserApprove";
		public static const OAUTH_CERTIFICATE_RESULT:String = "oauthCertifcateResult";
		
		public static const LOAD_GENERAL_API_RESULT:String = "loadGeneralApiResult";
		
		public static const LOAD_PUBLIC_TIMELINE_RESULT:String = "loadPublicTimeLineResult";
		public static const LOAD_FRIENDS_TIMELINE_RESULT:String = "loadFriendsTimeLineResult";
		public static const LOAD_USER_TIMELINE_RESULT:String = "loadUserTimeLineResult";
		public static const LOAD_MENSIONS_RESULT:String = "loadMensionsResult";
		public static const LOAD_COMMENTS_TIMELINE_RESULT:String = "loadCommentsTimelineResult";
		public static const LOAD_MY_COMMENTS_RESULT:String = "loadMyCommentsResult";
		public static const LOAD_COMMENTS_TO_ME_RESULT:String = "loadCommentsToMeResult";
		public static const LOAD_COMMENTS_RESULT:String = "loadCommentsResult";
		public static const LOAD_STATUS_COUNTS_RESULT:String = "loadStatusCountsResult";
		public static const REPOST_TIMELINE_RESULT:String = "repostTimelineResult";
		public static const REPOST_BY_ME_RESULT:String = "repostByMeResult";
		public static const LOAD_STATUS_UNREAD_RESULT:String = "loadStatusUnreadResult";
		
		public static const UPDATE_STATUS_RESULT:String = "updateStatusResult";
		public static const DELETE_STATUS_RESULT:String = "deleteStatusResult";
		public static const LOAD_STATUS_INFO_RESULT:String = "loadStatusInfoResult";
		public static const DELETE_COMMENT_RESULT:String = "deleteCommentResult";
		public static const COMMENT_STATUS_RESULT:String = "commentStatusResult";
		public static const REPOST_STATUS_RESULT:String = "repostStatusResult";
		public static const REPLY_STATUS_RESULT:String = "replyStatusResult";
		public static const RESET_STATUS_COUNT_RESULT:String = "resetStatusResult";
		public static const DELETE_COMMENT_PATCH_RESULT:String = "deleteCommentPatchResult";
		
		public static const LOAD_DIRECT_MESSAGES_RECEIVED_RESULT:String = "loadDirectMessagesReceivedResult";
		public static const LOAD_DIRECT_MESSAGES_SENT_RESULT:String = "loadDicrectMessagesSentResult";
		public static const SEND_DIRECT_MESSAGE_RESULT:String = "sendDirectMessageResult";
		public static const DELETE_DIRECT_MESSAGE_RESULT:String = "deleteDirectMessageResult";
		
		public static const LOAD_USER_INFO_RESULT:String = "loadUserInfoResult";
		public static const LOAD_FRIENDS_INFO_RESULT:String = "loadFriendsInfoResult";
		public static const LOAD_FOLLOWERS_INFO_RESULT:String = "loadFollowersInfoResult";
		public static const LOAD_HOT_USERS_RESULT:String = "loadHotUsersResult";
		public static const UPDATE_FRIENDS_REMARK_RESULT:String = "updateFriendsRemarkResult";
		
		public static const FOLLOW_RESULT:String = "followResult";
		public static const CANCEL_FOLLOWING_RESULT:String = "cancelFollowingResult";
		public static const CHECK_IS_FOLLOWING_RESULT:String = "checkIsFollowingResult";
		
		public static const LOAD_FRIENDS_ID_LIST_RESULT:String = "loadFriendsIDListResult";
		public static const LOAD_FOLLOWERS_ID_LIST_RESULT:String = "loadFollowersIDListResult";
		
		public static const VERIFY_CREDENTIALS_RESULT:String = "verifyCredentialsResult";
		public static const GET_RATE_LIMIT_STATUS_RESULT:String = "getRateLimitStatusResult";
		public static const LOGOUT_RESULT:String ="logoutResult";
		public static const UPDATE_PROFILE_RESULT:String = "updateProfileResult";
		public static const UPDATE_PROFILE_IMAGE_RESULT:String = "updateProfileImageResult";
		
		public static const LOAD_FAVORITE_LIST_RESULT:String = "loadFavoriteListResult";
		public static const ADD_TO_FAVORITES_RESULT:String = "addToFavoritesResult";
		public static const REMOVE_FROM_FAVORITES_RESULT:String = "removeFromFavoritesResult";	
		
		public static const ENABLE_NOTIFICATION_RESULT:String = "enableNotificationResult";
		
		public static const LOAD_PROVINCE_CITY_ID_LIST_RESULT:String = "loadProvinceCityIdListResult";
		/**
		 * 请求所返回后的结果。
		 * 返回值的具体内容请参照MicroBlog类的文档。
		 * 
		 * @see com.sina.microblog.Microblog
		 */ 
		public var result:Object;
		/**
		 * 当请求返回的结果集支持分页时，该属性标识指向下一个页面的指针。
		 * 并不是所有的MicroBlogEvent都会使用这个属性。
		 * 
		 * @see com.sina.microblog.Microblog
		 */ 
		public var nextCursor:Number;
		/**
		 * 当请求返回的结果集支持分页时，该属性标识指向上一个页面的指针。
		 * 并不是所有的MicroBlogEvent都会使用这个属性。
		 * 
		 * @see com.sina.microblog.Microblog
		 */ 
		public var previousCursor:Number;
		
		public function MicroBlogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e:MicroBlogEvent = new MicroBlogEvent(type, bubbles, cancelable);
			e.result = result;
			e.previousCursor = previousCursor;
			e.nextCursor = nextCursor;
			return e;
		}
		
	}
}