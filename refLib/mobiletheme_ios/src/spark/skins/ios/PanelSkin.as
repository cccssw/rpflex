package spark.skins.ios
{

import mx.core.DPIClassification;

import spark.components.Group;
import spark.components.Panel;
import spark.components.supportClasses.StyleableTextField;
import spark.core.SpriteVisualElement;
import spark.skins.ios160.assets.PanelChrome;
import spark.skins.ios320.assets.PanelChrome;
import spark.skins.mobile.supportClasses.MobileSkin;

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
                backgroundClass = spark.skins.ios320.assets.PanelChrome;
                padding = 40;
                break;
            default:
                backgroundClass = spark.skins.ios160.assets.PanelChrome;
                padding = 20;
                break;
        }
    }
    
    public var hostComponent:Panel;
    
    public var titleDisplay:StyleableTextField;
    
    public var contentGroup:Group;
    
    private var background:SpriteVisualElement;
    
    private var backgroundClass:Object;
    
    private var padding:Number;
    
    override protected function createChildren():void
    {
        super.createChildren();
        
        background = new backgroundClass;
        addChild(background);
        
        // use StyleableTextField
        titleDisplay = StyleableTextField(createInFontContext(StyleableTextField));
        titleDisplay.selectable = false;
        titleDisplay.editable = false;
        
        // pass styles from the skin to the StyleableTextField
        titleDisplay.styleName = this;
        addChild(titleDisplay);
        
        contentGroup = new Group();
        addChild(contentGroup);
    }
    
    override protected function commitProperties():void
    {
        super.commitProperties();
        
        titleDisplay.setStyle("fontWeight", "bold");
    }
    
    override protected function measure():void
    {
        // max of contentGroup width or titleDisplay or background
        measuredWidth = Math.max(
            getElementPreferredWidth(background),
            getElementPreferredWidth(contentGroup),
            getElementPreferredWidth(titleDisplay)) + (padding * 2);
        
        // height of contentGroup plus titleDisplay
        var contentHeight:Number = getElementPreferredHeight(contentGroup) + getElementPreferredHeight(titleDisplay)
            + (padding * 3);
        
        // max of content height or background
        measuredHeight = Math.max(contentHeight, getElementPreferredHeight(background));
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
        
        var w:Number = unscaledWidth - (padding * 2);
        
        // set FXG position to fill
        setElementPosition(background, 0, 0);
        setElementSize(background, unscaledWidth, unscaledHeight);
        
        var titleHeight:Number = getElementPreferredHeight(titleDisplay);
        var titleWidth:Number = getElementPreferredWidth(titleDisplay);
        
        // center title
        var titleX:Number = padding + Math.max(0, (w - titleWidth) / 2);
        
        setElementPosition(titleDisplay, titleX, padding);
        setElementSize(titleDisplay, titleWidth, titleHeight);
        
        // contentGroup fills in the remaining space
        var contentY:Number = padding + titleHeight + padding;
        setElementPosition(contentGroup, padding, contentY);
        setElementSize(contentGroup, w, unscaledHeight - contentY - padding);
    }
}
}