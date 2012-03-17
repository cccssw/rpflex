package spark.skins.ios
{
import spark.skins.mobile.HScrollBarThumbSkin;

public class HScrollBarThumbSkin extends spark.skins.mobile.HScrollBarThumbSkin
{
    public function HScrollBarThumbSkin()
    {
        super();
    }
    
    override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
    {
        var thumbHeight:Number = unscaledHeight - paddingBottom;
        
        graphics.beginFill(getStyle("chromeColor"), 1);
        graphics.drawRoundRect(paddingHorizontal, 0, 
            unscaledWidth - 2 * paddingHorizontal, thumbHeight, 
            thumbHeight, thumbHeight);
        
        graphics.endFill();
    }
}
}