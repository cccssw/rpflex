package spark.skins.ios
{
import flash.display.DisplayObject;

import mx.core.DPIClassification;
import mx.core.mx_internal;

import spark.skins.ios160.assets.Button_fillDown;
import spark.skins.ios160.assets.Button_fillUp;
import spark.skins.ios240.assets.Button;
import spark.skins.ios240.assets.Button_fillDown;
import spark.skins.ios240.assets.Button_fillUp;
import spark.skins.ios320.assets.Button;
import spark.skins.ios320.assets.Button_fillDown;
import spark.skins.ios320.assets.Button_fillUp;
import spark.skins.mobile.ButtonSkin;
import spark.skins.mobile.supportClasses.MobileSkin;

use namespace mx_internal;

public class ButtonSkin extends spark.skins.mobile.ButtonSkin
{
    private static const DEFAULT_FILL_COLOR:Number = 0x282E38;
    
    public function ButtonSkin()
    {
        super();
        
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                borderSkin = spark.skins.ios320.assets.Button;
                upBorderSkin = spark.skins.ios320.assets.Button_fillUp;
                downBorderSkin = spark.skins.ios320.assets.Button_fillDown;
                
                layoutGap = 10;
                layoutPaddingLeft = 20;
                layoutPaddingRight = 20;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 262;
                measuredDefaultHeight = 88;
                
                break;
            }
            case DPIClassification.DPI_240:
            {
                borderSkin = spark.skins.ios240.assets.Button;
                upBorderSkin = spark.skins.ios240.assets.Button_fillUp;
                downBorderSkin = spark.skins.ios240.assets.Button_fillDown;
                
                layoutGap = 8;
                layoutPaddingLeft = 15;
                layoutPaddingRight = 15;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 196;
                measuredDefaultHeight = 66;
                
                break;
            }
            default:
            {
                borderSkin = spark.skins.ios160.assets.Button;
                upBorderSkin = spark.skins.ios160.assets.Button_fillUp;
                downBorderSkin = spark.skins.ios160.assets.Button_fillDown;
                
                layoutGap = 5;
                layoutPaddingLeft = 10;
                layoutPaddingRight = 10;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                measuredDefaultWidth = 131;
                measuredDefaultHeight = 44;
                
                break;
            }
        }
    }
    
    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------
    
    private var borderSkin:Class;
    
    private var colorized:Boolean;
    
    private var borderBackground:DisplayObject;
    
    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------
    
    override protected function createChildren():void
    {
        borderBackground = (new borderSkin() as DisplayObject);
        addChild(borderBackground);
        
        super.createChildren();
    }
    
    override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.layoutContents(unscaledWidth, unscaledHeight);
        
        // move border to 0;
        removeChild(borderBackground);
        addChildAt(borderBackground, 0);
        
        setElementSize(borderBackground, unscaledWidth, unscaledHeight);
        setElementPosition(labelDisplayShadow, labelDisplay.x, labelDisplay.y - 1);
    }
    
    override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
    {
        // omit call to super.drawBackground() to apply tint instead and don't draw fill
        var chromeColor:uint = getStyle("chromeColor");
        
        if (colorized || (chromeColor != DEFAULT_FILL_COLOR))
        {
            // apply tint instead of fill
            applyColorTransform(border, DEFAULT_FILL_COLOR, chromeColor);
            
            // if we restore to original color, unset colorized
            colorized = (chromeColor != DEFAULT_FILL_COLOR);
        }
    }
}
}