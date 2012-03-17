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

package spark.skins.mobile
{   
import mx.core.DPIClassification;
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.DataGroup;
import spark.components.ListForm;
import spark.components.supportClasses.StyleableTextField;
import spark.layouts.HorizontalAlign;
import spark.layouts.VerticalLayout;
import spark.skins.mobile.supportClasses.MobileSkin;

use namespace mx_internal;

/**
 *  Minimal List skin implementation without a scroller.
 * 
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 2.5 
 *  @productversion Flex 4.5
 */
public class ListFormSkin extends MobileSkin
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
    public function ListFormSkin()
    {
        super();
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
            {
                titlePaddingLeft = 10;
                break;
            }
            case DPIClassification.DPI_240:
            {
                titlePaddingLeft = 7;
                break;
            }
            default:
            {
                // default DPI_160
                titlePaddingLeft = 5;
                break;
            }
        }
    }
    
    protected var titlePaddingLeft:Number;
    
    //--------------------------------------------------------------------------
    //
    //  Skin parts
    //
    //--------------------------------------------------------------------------
    
    /**
     *  @copy spark.skins.spark.ApplicationSkin#hostComponent
     */
    public var hostComponent:ListForm;
    
    public var dataGroup:DataGroup;
    
    public var titleDisplay:StyleableTextField;
    
    private var titleDisplayWrapper:UIComponent;
    
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
        // create the data group to house the buttons
        if (!dataGroup)
        {
            dataGroup = new DataGroup();
            var vLayout:VerticalLayout = new VerticalLayout();
            vLayout.gap = 0;
            vLayout.horizontalAlign = HorizontalAlign.JUSTIFY;
            dataGroup.layout = vLayout;
            addChild(dataGroup);
        }
        
        if (!titleDisplay)
        {
            titleDisplayWrapper = new UIComponent();
            titleDisplayWrapper.id = "titleDisplay";
            
            titleDisplay = StyleableTextField(createInFontContext(StyleableTextField));
            titleDisplay.styleName = titleDisplayWrapper;
            titleDisplay.editable = false;
            titleDisplay.selectable = false;
            
            titleDisplay.useTightTextBounds = true;
            
            titleDisplayWrapper.addChild(titleDisplay);
            addChild(titleDisplayWrapper);
        }
    }
    
    /**
     *  @private
     */
    override protected function commitCurrentState():void
    {
        alpha = (currentState == "disabled") ? 0.5 : 1;
    }
    
    /**
     *  @private
     */
    override protected function measure():void
    {
        var titleHeight:Number = titleDisplay.measuredTextSize.y;
        var titleWidth:Number = titleDisplay.measuredTextSize.x;
        
        measuredWidth = Math.max(dataGroup.measuredWidth, titleWidth);
        measuredHeight = dataGroup.measuredHeight + titleHeight;
        
        measuredMinWidth = Math.max(dataGroup.measuredMinWidth, titleWidth);
        measuredMinHeight = dataGroup.measuredMinHeight + titleHeight;
    }
    
    override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.drawBackground(unscaledWidth, unscaledHeight);
        
        if (titleDisplay.text != "")
        {
            var titleAreaHeight:Number = getElementPreferredHeight(titleDisplay) * 2;
            graphics.beginFill(titleDisplay.getStyle("chromeColor"), titleDisplay.getStyle("backgroundAlpha"));
            graphics.drawRect(0, 0, unscaledWidth, titleAreaHeight);
            graphics.endFill();
        }
    }
    
    /**
     *  @private
     */
    override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.layoutContents(unscaledWidth, unscaledHeight);
        
        var titleHeight:Number = (titleDisplay.text != "")
            ? getElementPreferredHeight(titleDisplay) : 0;
        var titleAreaHeight:Number = titleHeight * 2;
        var titleAreaY:Number = titleHeight / 2;
        
        setElementPosition(titleDisplay, titlePaddingLeft, titleAreaY);
        setElementSize(titleDisplay, unscaledWidth - titlePaddingLeft, titleHeight);
        
        setElementPosition(dataGroup, 0, titleAreaHeight);
        setElementSize(dataGroup, unscaledWidth, unscaledHeight - titleAreaHeight);
    }
}
}