package com.rpphoto.model
{
	import com.sina.microblog.*;
	import com.sina.microblog.data.*;
	import com.sina.microblog.events.*;
	
	import flash.events.EventDispatcher;
	
	import views.Share2Weibo_XAuth;
	
	public class WeiBoAPIManager extends EventDispatcher
	{
		private var _microBlog:MicroBlog;
		private static const SEARCH_STATUS_RESULT:String = "searchStatusResult";
		private static const SEARCH_STATUS_ERROR:String = "searchStatusError";
		private static const SEARCH_USER_RESULT:String = "searchUserResult";
		private static const SEARCH_USER_ERROR:String = "searchUserError";
		private static const COMMENT_RESULT:String = "commentResult";
		private static const COMMENT_ERROR:String = "commentError";
		private static const EMOTION_ERROR:String = "emotionError";
		private static const EMOTION_RESULT:String = "emotionResult";
		private static const AT_USER_URL_RESULT:String = "atUserResult";
		private static const AT_USER_URL:String = "search/suggestions/at_users.xml";
		private static const DEFAULT_ERROR:String = "defaultError";
		private static var _instance:WeiBoAPIManager;
		
		public function WeiBoAPIManager()
		{
			this._microBlog = new MicroBlog();
			this.init();
			return;
		}// end function
		
		public function loginWithPIN(pin:String):void
		{
			microBlog.pin=pin;
		}
		
		private function init() : void
		{
			this._microBlog.source = "3002490358";//Yours:3304848270 
			this._microBlog.consumerKey = "3002490358";//Yours:3304848270 
			this._microBlog.consumerSecret = "3xxxx6d61f2084";//Yours:3xxxx6d61f2084
			this._microBlog.isTrustDomain = true;
			
			//this._microBlog.addEventListener(MicroBlogEvent.VERIFY_CREDENTIALS_RESULT,Share2Weibo.onVerifyCredentialsResult);
//			this._microBlog.addEventListener(MicroBlogErrorEvent.VERIFY_CREDENTIALS_ERROR, this.onVerifyCredentialsError);
//			this._microBlog.addEventListener(MicroBlogErrorEvent.OAUTH_CERTIFICATE_ERROR, this.onVerifyCredentialsError);
//			this._microBlog.addEventListener(MicroBlogEvent.UPDATE_STATUS_RESULT, this.onUpdateStatusResult);
//			this._microBlog.addEventListener(MicroBlogErrorEvent.UPDATE_STATUS_ERROR, this.onUpdateStatusError);
			/*
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_FRIENDS_TIMELINE_RESULT, this.onLoadFriendsTimelineResult);
			this._microBlog.addEventListener(MicroBlogErrorEvent.LOAD_FRIENDS_TIMELINE_ERROR, this.onLoadFriendsTimelineError);
			
			this._microBlog.addEventListener(MicroBlogErrorEvent.LOAD_COMMENTS_TO_ME_ERROR, this.onLoadCommentToMeError);
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_COMMENTS_TO_ME_RESULT, this.onLoadCommentToMeResualt);
			this._microBlog.addEventListener(MicroBlogErrorEvent.LOAD_COMMENTS_ERROR, this.onLoadCommentsError);
			this._microBlog.addEventListener(MicroBlogErrorEvent.LOAD_MENSIONS_ERROR, this.onLoadMentionError);
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_MENSIONS_RESULT, this.onLoadMentionResult);
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_DIRECT_MESSAGES_RECEIVED_RESULT, this.onLoadDirectMessageReceivedResult);
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_STATUS_INFO_RESULT, this.onLoadStatusInfoResult);
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_COMMENTS_RESULT, this.onLoadCommentsResult);
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_STATUS_UNREAD_RESULT, this.onLoadStatusUnreadResult);
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_FOLLOWERS_INFO_RESULT, this.onLoadFollowersInfoResult);
			this._microBlog.addEventListener(MicroBlogEvent.RESET_STATUS_COUNT_RESULT, this.onResetStatusCountResult);
			this._microBlog.addEventListener(MicroBlogEvent.REPOST_STATUS_RESULT, this.onRepostStatusResult);
			this._microBlog.addEventListener(MicroBlogErrorEvent.REPOST_STATUS_ERROR, this.onRepostStatusError);
			this._microBlog.addEventListener(MicroBlogErrorEvent.COMMENT_STATUS_ERROR, this.onRepostStatusError);
			this._microBlog.addEventListener(MicroBlogErrorEvent.REPLY_STATUS_ERROR, this.onRepostStatusError);
			this._microBlog.addEventListener(MicroBlogEvent.COMMENT_STATUS_RESULT, this.onUpdateStatusResult);
			this._microBlog.addEventListener(MicroBlogEvent.REPLY_STATUS_RESULT, this.onUpdateStatusResult);
			this._microBlog.addEventListener(MicroBlogEvent.LOAD_USER_INFO_RESULT, this.onLoadUserInfoResult);
			this._microBlog.addEventListener(MicroBlogErrorEvent.LOAD_USER_INFO_ERROR, this.onLoadUserInfoError);
			this._microBlog.addEventListener(MicroBlogEvent.UPLOAD_PIC, this.onUpLoadPicResult);
			this._microBlog.addEventListener(AT_USER_URL_RESULT, this.onAtUserResult);
			this._microBlog.addEventListener(MicroBlogEvent.SEND_DIRECT_MESSAGE_RESULT, this.onRepostStatusResult);
			this._microBlog.addEventListener(MicroBlogErrorEvent.SEND_DIRECT_MESSAGE_ERROR, this.onDirectMessageError);
			this._microBlog.addEventListener(COMMENT_RESULT, this.onCommentResult);
			this._microBlog.addEventListener(COMMENT_ERROR, this.onCommentError);
			*/
			return;
		}// end function
		public function get microBlog() : MicroBlog
		{
			return this._microBlog;
		}// end function
		
		public static function get instance() : WeiBoAPIManager
		{
			if (_instance == null)
			{
				_instance = new WeiBoAPIManager;
			}
			return _instance;
		}// end function
		
		private function onVerifyCredentialsResult(event:MicroBlogEvent) : void
		{
			//Controller.getTwisAfterLogin(event.result as MicroBlogUser);
			//Share2Weibo.instance.VerifyCredentialsResult();
			return;
		}// end function
		
		private function onVerifyCredentialsError(event:MicroBlogErrorEvent) : void
		{
			//Controller.VerifyCredentialsError(event);
			Share2Weibo_XAuth.instance.VerifyCredentialsError(event);
			return;
		}// end function
		private function onUpdateStatusResult(event:MicroBlogEvent) : void
		{
			//Controller.VerifyCredentialsError(event);
			Share2Weibo_XAuth.instance.UpdateStatusResult(event);
			return;
		}// end function
		private function onUpdateStatusError(event:MicroBlogErrorEvent) : void
		{
			//Controller.VerifyCredentialsError(event);
			Share2Weibo_XAuth.instance.UpdateStatusError(event);
			return;
		}// end function
	}
}