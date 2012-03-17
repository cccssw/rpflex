package controls
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import spark.components.Button;
	
	[Style(name="imageSkin",type="*")]  
	[Style(name="imageSkinDisabled",type="*")]  
	[Style(name="imageSkinDown",type="*")]  
	[Style(name="imageSkinOver",type="*")]   
	
	public class ImgButton extends Button
	{
		public function ImgButton(){
			super();
			//this.setStyle("cornerRadius",10);
			this.buttonMode = true;
		}
	}
}