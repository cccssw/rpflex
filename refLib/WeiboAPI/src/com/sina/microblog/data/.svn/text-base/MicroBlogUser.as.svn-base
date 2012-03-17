package com.sina.microblog.data
{

	/**
	 * MicroBlogUser是一个数据封装类(Value Object)，该类代表一个微博用户
	 */ 
	public class MicroBlogUser
	{
		/**
		 * 用户ID
		 */ 
		public var id:String;
		
		/**
		 * 微博昵称
		 */  
		public var screenName:String;
		/**
		 * 用户名
		 */ 
		public var name:String;
		/**
		 * 省份
		 */ 
		public var province:String;
		/**
		 * 城市
		 */ 
		public var city:String;
		/**
		 * 地理位置
		 */ 
		public var location:String;
		/**
		 * 描述
		 */ 
		public var description:String;
		
		/**
		 * 用户的首页URL地址
		 */ 
		public var url:String;
		
		/**
		 * 头像图片地址
		 */ 
		public var profileImageUrl:String;
		
		/**
		 * 用户个性化URL 
		 */
		public var domain:String;
		
		/**
		 * 性别
		 */ 
		public var gender:String;
		/**
		 * 邮件
		 */ 
		//public var email:String;
		/**
		 * QQ号码
		 */ 
		//public var qq:String;
		/**
		 * MSN帐号
		 */ 
		//public var msn:String;
		/**
		 * 粉丝数量
		 */ 
		public var followersCount:uint;
		/**
		 * 关注（好友）数量
		 */ 
		public var friendsCount:uint;
		/**
		 * 已发表微博数量
		 */ 
		public var statusesCount:uint;
		/**
		 * 已收藏微博数量
		 */ 
		public var favouritesCount:uint;
		/**
		 * 用户注册日期
		 */ 
		public var createdAt:Date;
		/**
		 * 该用户是否follow当前用户
		 */ 
		public var isFollowingMe:Boolean;
		/**
		 * 是否为认证用户
		 */ 
		public var isVerified:Boolean;
		/**
		 * 用户背景图片的URL地址
		 */ 
		//public var profileBackgroundImageUrl:String;

		/**
		 * 是否允许任何人给我发私信
		 */
		public var allowAllActMsg:Boolean;
		
		/**
		 * 用户是否保护自己的信息
		 */ 
		//public var isProtected:Boolean;
		/**
		 * 背景色
		 */			
		//public var profileBackgroundColor:Number;
		/**
		 * 文字颜色
		 */		
		//public var profileTextColor:Number;
		/**
		 * 链接颜色
		 */ 		
		//public var profileLinkColor:Number;
		/**
		 * 侧边栏填充颜色
		 */ 
		//public var profileSidebarFillColor:Number;
		/**
		 * 侧边栏边框颜色
		 */ 
		//public var profileSidebarBorderColor:Number;
		/**
		 * 用户所在时区相对于UTC时间的间隔
		 */ 
		//public var utcOffset:Number;
		/**
		 * 用户所处的时区
		 */ 
		//public var timeZone:String;
		/**
		 * 是否允许通知
		 */ 
		//public var notificationsEnabled:Boolean;
		/**
		 * 是否使用地理位置信息
		 */ 
		public var geoEnabled:Boolean;
		/**
		 * 用户当前的状态 （最近一条微博）
		 */ 
		public var status:MicroBlogStatus;
		
		/**
		 * @private
		 */ 
		public function MicroBlogUser(user:XML)
		{
			id = String(user.id);
			screenName = user.screen_name;
			name = user.name;
			province = user.province;
			city = user.city;
			location = user.location;
			description = user.description;
			profileImageUrl = user.profile_image_url;
			domain = user.domain;
			gender = user.gender;
			//email = user.email;
			//qq = user.qq;
			//msn = user.msn;
			followersCount = uint(user.followers_count);
			friendsCount = uint(user.friends_count);
			statusesCount = uint(user.statuses_count);
			favouritesCount = uint(user.favourites_count);
			
			isFollowingMe = user.following == "true";
			
			isVerified = user.verified == "true";
			//profileBackgroundImageUrl = user.profile_background_image_url;
			url = user.url;
			//isProtected = user.protected == "true";
			//profileBackgroundColor = Number("0x" + user.profile_background_color);
			//profileTextColor = Number("0x" + user.profile_text_color);
			//profileLinkColor = Number("0x" + user.profile_link_color);
			//profileSidebarFillColor = Number("0x" + user.profile_sidebar_fill_color);
			//profileSidebarBorderColor = Number("0x" + user.profile_sidebar_border_color);
			//utcOffset = Number ( user.utc_offset);
			//timeZone = user.time_zone;
			//isProfileBackgroundTile = user.profile_background_tile == "true";
			//notificationsEnabled = user.notifications == "true";
			geoEnabled = user.geo_enabled == "true";
			allowAllActMsg = user.allow_all_act_msg == "true";
			if ( user.child("status").length() > 0)
			{
				status = new MicroBlogStatus(user.status[0]);
			}
		}
		
		
	}
}