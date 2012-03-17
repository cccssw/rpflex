package spark.skins.ios
{
import mx.core.DPIClassification;

import spark.skins.mobile.HScrollBarSkin;

public class HScrollBarSkin extends spark.skins.mobile.HScrollBarSkin
{
    public function HScrollBarSkin()
    {
        super();
        
        thumbSkinClass = spark.skins.ios.HScrollBarThumbSkin;
        
        // Depending on density set our measured width
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                minHeight = 15;
                break;
            }
            case DPIClassification.DPI_240:
            {
                minHeight = 11;
                break;
            }
            default:
            {
                // default DPI_160
                minHeight = 7;
                break;
            }
        }
    }
}
}