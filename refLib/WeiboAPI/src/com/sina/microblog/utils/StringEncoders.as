package com.sina.microblog.utils
{
	import flash.utils.ByteArray;
	
	/**
	 * @private
	 * 这是工具类，用于对文本信息进行url编码.
	 */ 
	public class StringEncoders
	{
		/**
		 * base OAUTH中需要使用utf8编码
		 * @param	string
		 * @return
		 */
		public static function utf8Encode(string:String):String
		{
			string = string.replace(/\r\n/g,'\n');
			string = string.replace(/\r/g,'\n');
		 
			var utfString:String = '';
		 
			for (var i:int = 0 ; i < string.length ; i++)
			{
				var chr:Number = string.charCodeAt(i);
				if (chr < 128)
				{
					utfString += String.fromCharCode(chr);
				}
				else if ((chr > 127) && (chr < 2048))
				{
					utfString += String.fromCharCode((chr >> 6) | 192);
					utfString += String.fromCharCode((chr & 63) | 128);
				}
				else
				{
					utfString += String.fromCharCode((chr >> 12) | 224);
					utfString += String.fromCharCode(((chr >> 6) & 63) | 128);
					utfString += String.fromCharCode((chr & 63) | 128);
				}
			}
		 
			return utfString;
		}
		
		
		
		/**
		 * 
		 * 将字符用utf8编码后做url编码.
		 * 
		 * @param srcStr 需要编码的源字符串.
		 * @return 编码后的字符串.
		 */
		public static function urlEncodeUtf8String(srcStr:String):String
		{
			if ( ! srcStr)
			{
				return "";
			}
			var ba:ByteArray = new ByteArray();
			var chr:Number = 0;
			ba.writeUTFBytes(srcStr);
			ba.position = 0;
			//trace(ba.toString());
			var utfStr:String='';
			//When encode the string using utf8. The encoder should encode the original string one byte by one byte.
			for (var i:int=0; i < ba.length; i++)
			{
				chr=ba[i];
				if (chr < 128)
				{
					utfStr+=String.fromCharCode(chr);
				}
				else if ((chr > 127) && (chr < 2048))
				{
					utfStr+=String.fromCharCode((chr >> 6) | 192);
					utfStr+=String.fromCharCode((chr & 63) | 128);
				}
				else
				{
					utfStr+=String.fromCharCode((chr >> 12) | 224);
					utfStr+=String.fromCharCode(((chr >> 6) & 63) | 128);
					utfStr+=String.fromCharCode((chr & 63) | 128);
				}
			}
			return urlEncode(utfStr);
		}
		/**
		 * @private
		 */
		public static function urlEncodeSpecial(srcStr:String):String
		{
			if ( ! srcStr)
			{
				return "";
			}
			var chr:Number = 0;
			var utfStr:String='';
			//When encode the string using utf8. The encoder should encode the original string one byte by one byte.
			for (var i:int=0; i < srcStr.length; i++)
			{
				chr=srcStr.charCodeAt(i);
				if (chr < 128)
				{
					utfStr+=String.fromCharCode(chr);
				}
				else if ((chr > 127) && (chr < 2048))
				{
					utfStr+=String.fromCharCode((chr >> 6) | 192);
					utfStr+=String.fromCharCode((chr & 63) | 128);
				}
				else
				{
					utfStr+=String.fromCharCode((chr >> 12) | 224);
					utfStr+=String.fromCharCode(((chr >> 6) & 63) | 128);
					utfStr+=String.fromCharCode((chr & 63) | 128);
				}
			}
			return urlEncode(utfStr);
		}
		/**
		 * 将字符用做url编码.
		 * 
		 * @param srcStr 需要编码的源字符串.
		 * @return 编码后的字符串.
		 */
		public static function urlEncode(srcStr:String):String
		{
			if ( ! srcStr)
			{
				return "";
			}
			var urlStr:String='';
			var chr:Number=0;
			
			for (var index:int=0; index < srcStr.length; index++)
			{
				//chr=utfStr.charCodeAt(index);
				chr = srcStr.charCodeAt(index);
				if ((chr >= 48 && chr <= 57) || // 09
					(chr >= 65 && chr <= 90) || // AZ
					(chr >= 97 && chr <= 122) || // az
					chr == 45 || // -
					chr == 95 || // _
					chr == 46 || // .
					chr == 126) // ~
				{
					urlStr+=String.fromCharCode(chr);
				}
				else
				{
					urlStr+='%' + chr.toString(16).toUpperCase();
				}
			}
			
			return urlStr;
		}
	}
}