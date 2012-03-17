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
import flash.display.GradientType;

import mx.core.DPIClassification;
import mx.core.mx_internal;
import mx.utils.ColorUtil;

import spark.components.ButtonBarButton;
import spark.components.DataGroup;
import spark.skins.mobile.ButtonBarSkin;
import spark.skins.mobile.supportClasses.ButtonBarButtonClassFactory;
import spark.skins.mobile.supportClasses.TabbedViewNavigatorTabBarHorizontalLayout;

use namespace mx_internal;

/**
 *  The default skin class for the Spark TabbedViewNavigator tabBar skin part.
 *  
 *  @see spark.components.TabbedViewNavigator#tabBar
 *  
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 2.5
 *  @productversion Flex 4.5
 */
public class TabbedViewNavigatorTabBarSkin extends ButtonBarSkin
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------
    
    /**
     * 
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 2.5 
     *  @productversion Flex 4.5
     * 
     */
    public function TabbedViewNavigatorTabBarSkin()
    {
        super();
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                borderWeight = 2;
                
                break;
            }
            case DPIClassification.DPI_240:
            {
                borderWeight = 1;
                
                break;
            }
            default:
            {
                // default DPI_160
                borderWeight = 1;
                
                break;
            }
        }
    }
    
    private var borderWeight:uint;
    
    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------
    
    /**
     *  @private
     */
    override protected function createChildren():void
    {
        if (!firstButton)
        {
            firstButton = new ButtonBarButtonClassFactory(ButtonBarButton);
            firstButton.skinClass = spark.skins.ios.TabbedViewNavigatorTabBarTabSkin
        }
        
        if (!lastButton)
        {
            lastButton = new ButtonBarButtonClassFactory(ButtonBarButton);
            lastButton.skinClass = spark.skins.ios.TabbedViewNavigatorTabBarTabSkin;
        }
        
        if (!middleButton)
        {
            middleButton = new ButtonBarButtonClassFactory(ButtonBarButton);
            middleButton.skinClass = spark.skins.ios.TabbedViewNavigatorTabBarTabSkin;
        }
        
        if (!dataGroup)
        {
            // TabbedViewNavigatorButtonBarHorizontalLayout for even percent layout
            var tabLayout:TabbedViewNavigatorTabBarHorizontalLayout = 
                new TabbedViewNavigatorTabBarHorizontalLayout();
            tabLayout.useVirtualLayout = false;
            
            dataGroup = new DataGroup();
            dataGroup.layout = tabLayout;
            addChild(dataGroup);
        }
    }
    
    override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.drawBackground(unscaledWidth, unscaledHeight);
        
        var chromeColor:uint = getStyle("chromeColor");
        var backgroundAlphaValue:Number = getStyle("backgroundAlpha");
        var colors:Array = [];
        
        // apply alpha to chromeColor fill only
        var backgroundAlphas:Array = [backgroundAlphaValue, backgroundAlphaValue, backgroundAlphaValue, backgroundAlphaValue];
        
        // exclude top and bottom 1px borders
        colorMatrix.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2, 0, 0);
        
        colors[0] = ColorUtil.adjustBrightness2(chromeColor, 15);
        colors[1] = ColorUtil.adjustBrightness2(chromeColor, 10);
        colors[2] = chromeColor;
        colors[3] = chromeColor;
        
        // glossy fill
        graphics.beginGradientFill(GradientType.LINEAR, colors, backgroundAlphas, ThemeConstants.CHROME_COLOR_RATIOS, colorMatrix);
        graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
        graphics.endFill();
        
        var borderInset:Number = borderWeight / 2;
        
        // top border dark
        graphics.lineStyle(borderWeight, 0, 0.6);
        graphics.moveTo(0, borderInset);
        graphics.lineTo(unscaledWidth, borderInset);
        
        // top border light
        graphics.lineStyle(borderWeight, 0xFFFFFF, 0.2);
        graphics.moveTo(0, borderWeight + borderInset);
        graphics.lineTo(unscaledWidth, borderWeight + borderInset);
    }
}
}