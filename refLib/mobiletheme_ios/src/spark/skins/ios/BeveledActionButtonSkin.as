////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2010 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package spark.skins.ios
{
import flash.display.DisplayObject;

import mx.core.DPIClassification;
import mx.core.mx_internal;

import spark.skins.ios160.assets.BeveledActionButton;
import spark.skins.ios160.assets.BeveledActionButton_fill;
import spark.skins.ios240.assets.BeveledActionButton;
import spark.skins.ios240.assets.BeveledActionButton_fill;
import spark.skins.ios320.assets.BeveledActionButton;
import spark.skins.ios320.assets.BeveledActionButton_fill;
import spark.skins.mobile.ButtonSkin;

use namespace mx_internal;

/**
 *  iOS-styled ActionBar Button skin for use in the navigationContent
 *  skinPart.
 * 
 *  @see spark.components.ActionBar#navigationContent
 * 
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 2.5 
 *  @productversion Flex 4.5
 */
public class BeveledActionButtonSkin extends spark.skins.mobile.ButtonSkin
{
    
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------
    
    /**
     *  Constructor.
     * 
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 2.5 
     *  @productversion Flex 4.5
     */
    public function BeveledActionButtonSkin()
    {
        super();
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                layoutBorderSize = 0;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                layoutPaddingLeft = 20;
                layoutPaddingRight = 20;
                measuredDefaultWidth = 60;
                measuredDefaultHeight = 60;
                
                upBorderSkin = spark.skins.ios320.assets.BeveledActionButton;
                downBorderSkin = spark.skins.ios320.assets.BeveledActionButton;
                fillClass = spark.skins.ios320.assets.BeveledActionButton_fill;
                
                break;
            }
            case DPIClassification.DPI_240:
            {
                layoutBorderSize = 0;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                layoutPaddingLeft = 15;
                layoutPaddingRight = 15;
                measuredDefaultWidth = 45;
                measuredDefaultHeight = 45;
                
                upBorderSkin = spark.skins.ios240.assets.BeveledActionButton;
                downBorderSkin = spark.skins.ios240.assets.BeveledActionButton;
                fillClass = spark.skins.ios240.assets.BeveledActionButton_fill;
                
                break;
            }
            default:
            {
                // 160
                layoutBorderSize = 0;
                layoutPaddingTop = 0;
                layoutPaddingBottom = 0;
                layoutPaddingLeft = 10;
                layoutPaddingRight = 10;
                measuredDefaultWidth = 30;
                measuredDefaultHeight = 30;
                
                upBorderSkin = spark.skins.ios160.assets.BeveledActionButton;
                downBorderSkin = spark.skins.ios160.assets.BeveledActionButton;
                fillClass = spark.skins.ios160.assets.BeveledActionButton_fill;
                
                break;
            }
        }
        
        // beveled buttons do not scale down
        minHeight = measuredDefaultHeight;
    }
    
    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------
    
    public static const FILL_COLOR_UP:Number = 0x444444;
    
    public static const FILL_COLOR_DOWN:Number = 0x666666;
    
    private var _fill:DisplayObject;
    
    private var fillClass:Class;
    
    private var colorized:Boolean;
    
    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------
    
    /**
     *  @private
     */
    override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.layoutContents(unscaledWidth, unscaledHeight);
        
        // add separate chromeColor fill graphic as the first layer
        if (!_fill && fillClass)
        {
            _fill = new fillClass();
            addChildAt(_fill, 1);
        }
        
        if (_fill)
        {
            // move to the first layer
            if (getChildIndex(_fill) != 1)
            {
                removeChild(_fill);
                addChildAt(_fill, 1);
            }
            
            setElementSize(_fill, unscaledWidth, unscaledHeight);
        }
    }
    
    override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
    {
        // omit call to super.drawBackground(), apply tint instead and don't draw fill
        var chromeColor:uint = getStyle("chromeColor");
        var offsetColor:uint = (currentState.indexOf("down") == 0) ? FILL_COLOR_DOWN : FILL_COLOR_UP;
        
        if (colorized || (chromeColor != offsetColor))
        {
            // apply tint instead of fill
            applyColorTransform(_fill, offsetColor, chromeColor);
            
            // if we restore to original color, unset colorized
            colorized = (chromeColor != offsetColor);
        }
    }
}
}