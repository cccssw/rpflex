package spark.skins.ios
{
import mx.core.DPIClassification;
import mx.core.mx_internal;

import spark.skins.mobile.VScrollBarSkin;

use namespace mx_internal;

public class VScrollBarSkin extends spark.skins.mobile.VScrollBarSkin
{
    public function VScrollBarSkin()
    {
        super();
        
        thumbSkinClass = spark.skins.ios.VScrollBarThumbSkin;
        
        // Depending on density set our measured width
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                minWidth = 15;
                break;
            }
            case DPIClassification.DPI_240:
            {
                minWidth = 11;
                break;
            }
            default:
            {
                // default DPI_160
                minWidth = 7;
                break;
            }
        }
    }
}
}