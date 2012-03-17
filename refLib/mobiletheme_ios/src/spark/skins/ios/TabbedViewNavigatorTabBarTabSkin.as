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
import mx.core.DPIClassification;
import mx.core.mx_internal;

import spark.skins.ios.assets.Blank;
import spark.skins.ios160.assets.TabbedViewNavigatorTabBarTab_selected;
import spark.skins.ios240.assets.TabbedViewNavigatorTabBarTab_selected;
import spark.skins.ios320.assets.TabbedViewNavigatorTabBarTab_selected;
import spark.skins.mobile.supportClasses.ButtonBarButtonSkinBase;

use namespace mx_internal;

/**
 *  ButtonBarButton skin base class for TabbedViewNavigator ButtonBarButtons.
 * 
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 2.5 
 *  @productversion Flex 4.5
 */
public class TabbedViewNavigatorTabBarTabSkin extends ButtonBarButtonSkinBase
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
    public function TabbedViewNavigatorTabBarTabSkin()
    {
        super();
        
        useCenterAlignment = false;
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                selectedBorderSkin = spark.skins.ios320.assets.TabbedViewNavigatorTabBarTab_selected;
                measuredDefaultHeight = 98;
                layoutPaddingTop = 6;
                layoutPaddingBottom = 10;
                maxWidth = 152;
                
                break;
            }
            case DPIClassification.DPI_240:
            {
                selectedBorderSkin = spark.skins.ios240.assets.TabbedViewNavigatorTabBarTab_selected;
                measuredDefaultHeight = 74;
                layoutPaddingTop = 4;
                layoutPaddingBottom = 8;
                maxWidth = 114;
                
                break;
            }
            default:
            {
                // default DPI_160
                selectedBorderSkin = spark.skins.ios160.assets.TabbedViewNavigatorTabBarTab_selected;
                measuredDefaultHeight = 49;
                layoutPaddingTop = 3;
                layoutPaddingBottom = 4;
                maxWidth = 76;
                
                break;
            }
        }
        
        // Can't have a borderless button
        // http://bugs.adobe.com/jira/browse/SDK-29434
        upBorderSkin = spark.skins.ios.assets.Blank;
        downBorderSkin = spark.skins.ios.assets.Blank;
        
        layoutBorderSize = 0;
        layoutPaddingLeft = 0;
        layoutPaddingRight = 0;
        layoutGap = 0;
    }
    
    /**
     *  @private
     */
    override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
    {
        // omit super.drawBackground(), draw hit zone
        graphics.beginFill(0, 0);
        graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
        graphics.endFill();
    }
}
}