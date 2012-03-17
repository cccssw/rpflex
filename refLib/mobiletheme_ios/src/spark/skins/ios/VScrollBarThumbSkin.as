package spark.skins.ios
{
import spark.skins.mobile.VScrollBarThumbSkin;

public class VScrollBarThumbSkin extends spark.skins.mobile.VScrollBarThumbSkin
{
    public function VScrollBarThumbSkin()
    {
        super();
    }
    
    override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
    {
        var thumbWidth:Number = unscaledWidth - paddingRight;
        
        graphics.beginFill(getStyle("chromeColor"), 0.5);
        graphics.drawRoundRect(0, paddingVertical, 
            thumbWidth, unscaledHeight - 2 * paddingVertical, 
            thumbWidth, thumbWidth);
        
        graphics.endFill();
    }
}
}