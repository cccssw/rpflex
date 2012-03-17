package controls
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import spark.components.Button;
	
	[Style(name="bgColor",type="*")]  
	
	public class BgButton extends Button
	{
		public function BgButton(){
			super();
			this.setStyle("cornerRadius",10);
			this.buttonMode = true;
		}
	}
}