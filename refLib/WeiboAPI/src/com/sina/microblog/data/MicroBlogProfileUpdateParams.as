package com.sina.microblog.data
{
	import com.sina.microblog.utils.StringEncoders;
	
	import flash.net.URLVariables;
	
	/**
	 * MicroBlogProfileUpdateParams是一个数据封装类(Value Object)，用于更新用户profile，详见新浪微博api网站
	 */ 
	public class MicroBlogProfileUpdateParams
	{
		public static const GENDER_MALE:String="m";
		public static const GENDER_FEMALE:String="f";

		private var _postData:URLVariables=new URLVariables();
		private var _isEmpty:Boolean=true;
		private var validatedGender:Array=["m", "f", "男", "女"];

		public function MicroBlogProfileUpdateParams()
		{
		}
		/**
		 * 设置用户昵称
		 */ 
		public function set name(value:String):void
		{
			if (value && value.length > 0)
			{
				//_postData.name=StringEncoders.urlEncodeUtf8String(value);
				_postData.name = value;
				_isEmpty=false;
			}
		}
		/**
		 * 设置用户性别
		 */
		public function set gender(value:String):void
		{
			if(value == GENDER_MALE || value == GENDER_FEMALE)
			{
				_postData.gender = value;
				_isEmpty=false;
			}
		}
		
		/**
		 * 设置用户省份
		 */
		public function set province(value:int):void
		{
			_postData.province = value;
			_isEmpty=false;
		}
		/**
		 * 设置用户城市
		 */
		public function set city(value:int):void
		{
			_postData.city = value;
			_isEmpty=false;
		}
		
		/**
		 * 设置用户描述
		 */
		public function set description(value:String):void
		{
			if (value && value.length > 0)
			{
				_postData.description= value;
				_isEmpty=false;
			}
		}
		/**
		 * @private
		 */
		public function get postData():URLVariables
		{
			return _postData;
		}
		/**
		 * @private
		 */
		public function get isEmpty():Boolean
		{
			return _isEmpty;
		}
	}
}