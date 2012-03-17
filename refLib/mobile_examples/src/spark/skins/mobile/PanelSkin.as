package spark.skins.mobile
{

import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.LineScaleMode;

import mx.core.DPIClassification;
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.Group;
import spark.components.Panel;
import spark.components.supportClasses.StyleableTextField;
import spark.core.SpriteVisualElement;
import spark.primitives.Line;
import spark.skins.mobile.supportClasses.MobileSkin;

use namespace mx_internal;

public class PanelSkin extends MobileSkin
{
    // step 1: declare host component
    // step 2: declare skin parts
    // step 3: override methods wizard:
    //         createChildren, measure, commitCurrentState, drawBackground, layoutContents
    
    public function PanelSkin()
    {
        super();
        
        switch (applicationDPI)
        {
            case DPIClassification.DPI_320:
                borderWeight = 4;
                break;
            case DPIClassification.DPI_240:
                borderWeight = 3;
                break;
            default:
                borderWeight = 2;
                break;
        }
    }
    
    public var hostComponent:Panel;
    
    private var titleDisplayWrapper:UIComponent;
    public var titleDisplay:StyleableTextField;
    
    public var contentGroup:Group;
    
    private var borderWeight:int;
    
    override protected function createChildren():void
    {
        super.createChildren();
        
        if (!titleDisplay)
        {
            // add IID for CSS ID selector support
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
        
        contentGroup = new Group();
        addChild(contentGroup);
    }
    
    override protected function measure():void
    {
        // max of contentGroup width or titleDisplay
        measuredWidth = Math.max(
            getElementPreferredWidth(contentGroup),
            getElementPreferredWidth(titleDisplay)) + (borderWeight * 2);
        
        // height of contentGroup plus titleDisplay
        measuredHeight = getElementPreferredHeight(contentGroup) + (getElementPreferredHeight(titleDisplay) * 3)
            + (borderWeight * 2);
    }
    
    override protected function commitCurrentState():void
    {
        super.commitCurrentState();
        
        // commit state-specific values
        alpha = (currentState.indexOf("disabled") == 0) ? 0.5 : 1;
    }
    
    override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.layoutContents(unscaledWidth, unscaledHeight);
        
        var titleHeight:Number = (titleDisplay.text != "")
            ? getElementPreferredHeight(titleDisplay) : 0;
        var titleAreaHeight:Number = titleHeight * 3;
        var titleDisplayY:Number = borderWeight + ((titleAreaHeight - titleHeight) / 2);
        
        var borderColor:Number = getStyle("borderColor");
        var borderAlpha:Number = getStyle("borderAlpha");
        var backgroundColor:Number = getStyle("backgroundColor");
        var backgroundAlpha:Number = getStyle("backgroundAlpha");
        
        var strokeAlign:Number = borderWeight / 2;
        var w:Number = unscaledWidth - (borderWeight * 2);
        var h:Number = unscaledHeight - (borderWeight * 2);
        
        // panel border + background
        graphics.lineStyle(borderWeight, borderColor, borderAlpha, false, LineScaleMode.NORMAL, null, JointStyle.MITER);
        graphics.beginFill(backgroundColor, backgroundAlpha);
        graphics.drawRect(strokeAlign, strokeAlign, unscaledWidth - borderWeight, unscaledHeight - borderWeight);
        graphics.endFill();
        
        // titleDisplay "chrome"
        titleDisplayWrapper.graphics.clear();
        titleDisplayWrapper.graphics.beginFill(0);
        titleDisplayWrapper.graphics.drawRect(borderWeight, borderWeight, w, titleAreaHeight); 
        
        // titleDisplay position
        setElementPosition(titleDisplay, borderWeight + (titleHeight / 2), titleDisplayY);
        setElementSize(titleDisplay, w - titleHeight, titleHeight);
        
        // contentGroup fills in the remaining space
        var contentY:Number = titleAreaHeight + borderWeight;
        setElementPosition(contentGroup, borderWeight, contentY);
        setElementSize(contentGroup, w, h - titleAreaHeight);
    }
}
}