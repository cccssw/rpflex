package spark.skins.ios
{
import mx.core.DPIClassification;
import mx.graphics.BitmapFillMode;

import spark.components.Image;
import spark.skins.ios160.assets.Background;
import spark.skins.ios320.assets.Background;
import spark.skins.mobile.SkinnableContainerSkin;

public class ViewSkin extends SkinnableContainerSkin
{
    private var borderClass:Class;
    private var backgroundImage:Image;
    
    public function ViewSkin()
    {
        super();
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
                borderClass = spark.skins.ios320.assets.Background;
                break;
            default:
                borderClass = spark.skins.ios160.assets.Background;
                break;
        }
    }
    
    override protected function createChildren():void
    {
        super.createChildren();
    }
    
    override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.layoutContents(unscaledWidth, unscaledHeight);
        
    }
}
}