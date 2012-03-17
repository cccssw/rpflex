package controls
{
	import flash.display.Sprite;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	public class ButtonImgDisplayState extends Sprite
	{
		[Embed( 'assets/ui/btn_share_btn_login_a.png' )]
		private var weibologin:Class;
		public function ButtonImgDisplayState(_alpha:Number)
		{
			addChild(weibologin);
			this.alpha = _alpha;
		}
	}
}