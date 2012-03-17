package com.sina.microblog.events
{
	import flash.events.Event;

	/**
	 * 所有对新浪微博API的请求会以事件的形式返回给调用者。当API请求出现错误时，MicroBlog类会派发MicroBlogErrorEvent事件.
	 * 
	 * <p>每个MicroBlogErrorEvent事件都有一个message属性用于保存错误信息。</br>
	 * API请求与事件的对应关系请参照MicroBlog类的文档。</p>
	 * 
	 * @see com.sina.microblog.MicroBlog
	 */ 	
	public class MicroBlogErrorEvent extends Event
	{
		public static const ANYWHERE_TOKEN_ERROR:String = "anywhereTokenError";
		
		
		public static const OAUTH_CERTIFICATE_ERROR:String = "oauthCertifcateError";
		
		public static const LOAD_GENERAL_API_ERROR:String = "loadGeneralApiError";
		
		public static const LOAD_PUBLIC_TIMELINE_ERROR:String = "loadPublicTimeLineError";
		public static const LOAD_FRIENDS_TIMELINE_ERROR:String = "loadFriendsTimeLineError";
		public static const LOAD_USER_TIMELINE_ERROR:String = "loadUserTimeLineError";
		public static const LOAD_MENSIONS_ERROR:String = "loadMensionsError";
		public static const LOAD_COMMENTS_TIMELINE_ERROR:String = "loadCommentsTimelineError";
		public static const LOAD_MY_COMMENTS_ERROR:String = "loadMyCommentsError";
		public static const LOAD_COMMENTS_TO_ME_ERROR:String = "loadCommentsToMeError";
		public static const LOAD_COMMENTS_ERROR:String = "loadCommentsError";
		public static const LOAD_STATUS_COUNTS_ERROR:String = "loadStatusCountsError";
		public static const REPOST_TIMELINE_ERROR:String = "repostTimelineError";
		public static const REPOST_BY_ME_ERROR:String = "repostByMeError";
		public static const LOAD_STATUS_UNREAD_ERROR:String = "loadStatusUnreadError";
		
		public static const UPDATE_STATUS_ERROR:String = "updateStatusError";
		public static const DELETE_STATUS_ERROR:String = "deleteStatusError";
		public static const LOAD_STATUS_INFO_ERROR:String = "loadStatusInfoError";
		public static const DELETE_COMMENT_ERROR:String = "deleteCommentError";
		public static const COMMENT_STATUS_ERROR:String = "commentStatusError";
		public static const REPOST_STATUS_ERROR:String = "repostStatusError";
		public static const REPLY_STATUS_ERROR:String = "replyStatusError";
		public static const RESET_STATUS_COUNT_ERROR:String = "resetStatusError";
		public static const DELETE_COMMENT_PATCH_ERROR:String = "deleteCommentPatchError";
		
		public static const LOAD_DIRECT_MESSAGES_RECEIVED_ERROR:String = "loadDirectMessagesReceivedError";
		public static const LOAD_DIRECT_MESSAGES_SENT_ERROR:String = "loadDicrectMessagesSentError";
		public static const SEND_DIRECT_MESSAGE_ERROR:String = "sendDirectMessageError";
		public static const DELETE_DIRECT_MESSAGE_ERROR:String = "deleteDirectMessageError";
		
		public static const LOAD_USER_INFO_ERROR:String = "loadUserInfoError";
		public static const LOAD_FRIENDS_INFO_ERROR:String = "loadFriendsInfoError";
		public static const LOAD_FOLLOWERS_INFO_ERROR:String = "loadFollowersInfoError";
		
		public static const FOLLOW_ERROR:String = "followError";
		public static const CANCEL_FOLLOWING_ERROR:String = "cancelFollowingError";
		public static const CHECK_IS_FOLLOWING_ERROR:String = "checkIsFollowingError";
		public static const LOAD_HOT_USERS_ERROR:String = "loadHotUsersError";
		public static const UPDATE_FRIENDS_REMARK_ERROR:String = "updateFriendsRemarkError";
		
		public static const LOAD_FRIENDS_ID_LIST_ERROR:String = "loadFriendsIDListError";
		public static const LOAD_FOLLOWERS_ID_LIST_ERROR:String = "loadFollowersIDListError";
		
		public static const VERIFY_CREDENTIALS_ERROR:String = "verifyCredentialsError";
		public static const GET_RATE_LIMIT_STATUS_ERROR:String = "getRateLimitStatusError";
		public static const LOGOUT_ERROR:String ="logoutError";
		public static const UPDATE_PROFILE_ERROR:String = "updateProfileError";
		public static const UPDATE_PROFILE_IMAGE_ERROR:String = "updateProfileImageError";
		
		public static const LOAD_FAVORITE_LIST_ERROR:String = "loadFavoriteListError";
		public static const ADD_TO_FAVORITES_ERROR:String = "addToFavoritesError";
		public static const REMOVE_FROM_FAVORITES_ERROR:String = "removeFromFavoritesError";
		
		public static const ENABLE_NOTIFICATION_ERROR:String = "enableNotificationError";
		
		public static const LOAD_PROVINCE_CITY_ID_LIST_ERROR:String = "loadProvinceCityIdListError";
		
		public static const NET_WORK_ERROR:String = "networkError";
		
		/**
		 * 请求失败后返回的错误信息
		 */ 
		public var message:String;
		
		/**
		 * 状态值
		 */
		public var status:int;
		
		public function MicroBlogErrorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}