package spark.components
{
import flash.display.GradientType;
import flash.geom.Matrix;

import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.utils.ColorUtil;


use namespace mx_internal;

/**
 * Rounded settings-list
 */
[Style(name="borderStyle", inherit="no", type="String", enumeration="normal,rounded")]

[Style(name="borderWeight", inherit="no", type="Number")]

[Style(name="cornerRadius", inherit="no", type="Number")]

[DefaultProperty("content")]

/**
 *  Item render with styles to support a List with rounded corners.
 *  Adds a content property to optionally display arbitrary UIComponents next
 *  to the decorator. Allows for "settings-list" pattern on Android as well
 *  as settings/data-entry-form pattern on iOS.
 */
public class ListFormItemRenderer extends IconItemRenderer
{
    public function ListFormItemRenderer()
    {
        super();
    }
    
    //----------------------------------
    //  decorator
    //----------------------------------
    
    /**
     *  @private 
     */ 
    private var _content:UIComponent;
    
    /**
     *  @private 
     */ 
    private var contentChanged:Boolean;
    
    /**
     *  Optional component content placed to the right of the decorator. 
     */
    public function get content():UIComponent
    {
        return _content;
    }
    
    /**
     *  @private
     */ 
    public function set content(value:UIComponent):void
    {
        if (value == _content)
            return;
        
        if (!value)
            removeChild(_content);
        
        _content = value;
        
        contentChanged = true;
        invalidateProperties();
    }
    
    /**
     *  @private
     */
    override protected function commitProperties():void
    {
        super.commitProperties();
        
        if (contentChanged)
        {
            contentChanged = false;
            
            if (content)
                addChild(content)
            
            invalidateSize();
            invalidateDisplayList();
        }
    }
    
    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
    {
        super.updateDisplayList(unscaledWidth, unscaledHeight);
        
        if (down)
            labelDisplay.setStyle("color", 0xFFFFFF);
        else
            labelDisplay.setStyle("color", getStyle("color"));
        
        labelDisplay.commitStyles();
    }
    
    override protected function measure():void
    {
        super.measure();
        
        if (content)
        {
            var paddingHeight:Number = getStyle("paddingTop") + getStyle("paddingBottom");
            measuredHeight = Math.max(measuredHeight, getElementPreferredHeight(content) + paddingHeight);
        }
    }
    
    override protected function drawBackground(unscaledWidth:Number, 
                                      unscaledHeight:Number):void
    {
        var isRounded:Boolean = getStyle("borderStyle") == "rounded";
        
        // figure out backgroundColor
        var backgroundColor:*;
        var downColor:* = getStyle("downColor");
        var drawBackground:Boolean = true;
        var cornerRadius:Number = getStyle("borderStyle") == "normal" ? 0 : getStyle("cornerRadius");
        var borderWeight:Number = getStyle("borderWeight");
        var topCornerRadius:Number = (itemIndex == 0) ? cornerRadius : 0;
        var bottomCornerRadius:Number = (isLastItem) ? cornerRadius : 0;
        var borderColor:Number = 0x999999; // TODO style
        
        if (down && downColor !== undefined)
        {
            backgroundColor = downColor;
        }
        // TODO show only for 5-way?
//        else if (showsCaret)
//        {
//            backgroundColor = getStyle("selectionColor");
//        }
        else
        {
            var alternatingColors:Array;
            var alternatingColorsStyle:Object = getStyle("alternatingItemColors");
            
            if (alternatingColorsStyle)
                alternatingColors = (alternatingColorsStyle is Array) ? (alternatingColorsStyle as Array) : [alternatingColorsStyle];
            
            if (alternatingColors && alternatingColors.length > 0)
            {
                // translate these colors into uints
                styleManager.getColorNames(alternatingColors);
                
                backgroundColor = alternatingColors[itemIndex % alternatingColors.length];
            }
            else
            {
                // don't draw background if it is the contentBackgroundColor. The
                // list skin handles the background drawing for us. 
                drawBackground = false;
            }
            
        } 
        
        var topSeparatorColor:uint;
        var topSeparatorAlpha:Number;
        var bottomSeparatorColor:uint;
        var bottomSeparatorAlpha:Number;
        
        // Selected and down states have a gradient overlay as well
        // as different separators colors/alphas
        if (down)
        {
            var colors:Array = [backgroundColor, ColorUtil.adjustBrightness2(backgroundColor, -20)];
            var alphas:Array = [1, 1];
            var ratios:Array = [0, 255];
            var matrix:Matrix = new Matrix();
            
            // gradient overlay
            matrix.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2, 0, 0 );
            graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matrix);
        }
        else
        {
            graphics.beginFill(backgroundColor, drawBackground ? 1 : 0);
        }
        
        // inset stroke for half-pixel alignment
        var insetBorder:Number = 0;
        
        if (isRounded)
        {
            insetBorder = borderWeight / 2;
            graphics.lineStyle(borderWeight, borderColor);
            
            // bottom border overlaps with next item renderer
            graphics.drawRoundRectComplex(insetBorder, insetBorder,
                unscaledWidth - borderWeight, unscaledHeight,
                topCornerRadius, topCornerRadius,
                bottomCornerRadius, bottomCornerRadius);
        }
        else
        {
            graphics.lineStyle();
            graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
        }
        
        graphics.endFill();
        
        if (!isRounded)
        {
            // separators are a highlight on the top and shadow on the bottom
            topSeparatorColor = 0xFFFFFF;
            topSeparatorAlpha = .3;
            bottomSeparatorColor = 0x000000;
            bottomSeparatorAlpha = .3;
            
            // draw separators
            // don't draw top separator for down and selected states
            if (!down)
            {
                graphics.beginFill(topSeparatorColor, topSeparatorAlpha);
                graphics.drawRect(0, 0, unscaledWidth, 1);
                graphics.endFill();
            }
            
            graphics.beginFill(bottomSeparatorColor, bottomSeparatorAlpha);
            graphics.drawRect(0, unscaledHeight - (isLastItem ? 0 : 1), unscaledWidth, 1);
            graphics.endFill();
            
            // bottom
            if (isLastItem)
            {
                // we want to offset the bottom by 1 so that we don't get
                // a double line at the bottom of the list if there's a 
                // border
                graphics.beginFill(topSeparatorColor, topSeparatorAlpha);
                graphics.drawRect(0, unscaledHeight + 1, unscaledWidth, 1);
                graphics.endFill();	
            }
        }
    }
    
    private var _isDownDispatched:Boolean = false;
    
    /**
     *  @private
     */
    override protected function layoutContents(unscaledWidth:Number,
                                               unscaledHeight:Number):void
    {
        // no need to call super.layoutContents() since we're changing how it happens here
        
        // start laying out our children now
        var iconWidth:Number = 0;
        var iconHeight:Number = 0;
        var decoratorWidth:Number = 0;
        var decoratorHeight:Number = 0;
        var contentWidth:Number = 0;
        var contentHeight:Number = 0;
        
        var hasLabel:Boolean = labelDisplay && labelDisplay.text != "";
        var hasMessage:Boolean = messageDisplay && messageDisplay.text != "";
        
        var paddingLeft:Number   = getStyle("paddingLeft");
        var paddingRight:Number  = getStyle("paddingRight");
        var paddingTop:Number    = getStyle("paddingTop");
        var paddingBottom:Number = getStyle("paddingBottom");
        var horizontalGap:Number = getStyle("horizontalGap");
        var verticalAlign:String = getStyle("verticalAlign");
        var verticalGap:Number   = (hasLabel && hasMessage) ? getStyle("verticalGap") : 0;
        
        var vAlign:Number;
        if (verticalAlign == "top")
            vAlign = 0;
        else if (verticalAlign == "bottom")
            vAlign = 1;
        else // if (verticalAlign == "middle")
            vAlign = 0.5;
        // made "middle" last even though it's most likely so it is the default and if someone 
        // types "center", then it will still vertically center itself.
        
        var viewWidth:Number  = unscaledWidth  - paddingLeft - paddingRight;
        var viewHeight:Number = unscaledHeight - paddingTop  - paddingBottom;
        
        // icon is on the left
        if (iconDisplay)
        {
            // set the icon's position and size
            setElementSize(iconDisplay, this.iconWidth, this.iconHeight);
            
            iconWidth = iconDisplay.getLayoutBoundsWidth();
            iconHeight = iconDisplay.getLayoutBoundsHeight();
            
            // use vAlign to position the icon.
            var iconDisplayY:Number = Math.round(vAlign * (viewHeight - iconHeight)) + paddingTop;
            setElementPosition(iconDisplay, paddingLeft, iconDisplayY);
        }
        
        // decorator is aligned next to icon
        if (decoratorDisplay)
        {
            decoratorWidth = getElementPreferredWidth(decoratorDisplay);
            decoratorHeight = getElementPreferredHeight(decoratorDisplay);
            
            setElementSize(decoratorDisplay, decoratorWidth, decoratorHeight);
            
            // decorator is always right aligned, vertically centered
            var decoratorY:Number = Math.round(0.5 * (viewHeight - decoratorHeight)) + paddingTop;
            setElementPosition(decoratorDisplay, unscaledWidth - paddingRight - decoratorWidth, decoratorY);
        }
        
        if (content)
        {
            contentWidth = getElementPreferredWidth(content);
            contentHeight = getElementPreferredHeight(content);
            
            setElementSize(content, contentWidth, contentHeight);
            
            // vertical center, constrain left of decorator
            var contentY:Number = Math.round(0.5 * (viewHeight - contentHeight)) + paddingTop;
            var contentGap:Number = (decoratorDisplay) ? horizontalGap : 0;
            setElementPosition(content, unscaledWidth - paddingRight - decoratorWidth - contentGap - contentWidth, contentY);
        }
        
        // Figure out how much space we have for label and message as well as the 
        // starting left position
        var labelComponentsViewWidth:Number = viewWidth - iconWidth - decoratorWidth - contentWidth;
        
        // don't forget the extra gap padding if these elements exist
        if (iconDisplay)
            labelComponentsViewWidth -= horizontalGap;
        if (decoratorDisplay)
            labelComponentsViewWidth -= horizontalGap;
        if (content)
            labelComponentsViewWidth -= horizontalGap;
        
        var labelComponentsX:Number = paddingLeft;
        if (iconDisplay)
            labelComponentsX += iconWidth + horizontalGap;
        
        // calculte the natural height for the label
        var labelTextHeight:Number = 0;
        
        if (hasLabel)
        {
            // reset text if it was truncated before.
            if (labelDisplay.isTruncated)
                labelDisplay.text = labelText;
            
            // commit styles to make sure it uses updated look
            labelDisplay.commitStyles();
            
            labelTextHeight = getElementPreferredHeight(labelDisplay);
        }
        
        if (hasMessage)
        {
            // commit styles to make sure it uses updated look
            messageDisplay.commitStyles();
        }
        
        // now size and position the elements, 3 different configurations we care about:
        // 1) label and message
        // 2) label only
        // 3) message only
        
        // label display goes on top
        // message display goes below
        
        var labelWidth:Number = 0;
        var labelHeight:Number = 0;
        var messageWidth:Number = 0;
        var messageHeight:Number = 0;
        
        if (hasLabel)
        {
            // handle labelDisplay.  it can only be 1 line
            
            // width of label takes up rest of space
            // height only takes up what it needs so we can properly place the message
            // and make sure verticalAlign is operating on a correct value.
            labelWidth = Math.max(labelComponentsViewWidth, 0);
            labelHeight = labelTextHeight;
            
            if (labelWidth == 0)
                setElementSize(labelDisplay, NaN, 0);
            else
                setElementSize(labelDisplay, labelWidth, labelHeight);
            
            // attempt to truncate text
            labelDisplay.truncateToFit();
        }
        
        if (hasMessage)
        {
            // handle message...because the text is multi-line, measuring and layout 
            // can be somewhat tricky
            messageWidth = Math.max(labelComponentsViewWidth, 0);
            
            // We get called with unscaledWidth = 0 a few times...
            // rather than deal with this case normally, 
            // we can just special-case it later to do something smarter
            if (messageWidth == 0)
            {
                // if unscaledWidth is 0, we want to make sure messageDisplay is invisible.
                // we could set messageDisplay's width to 0, but that would cause an extra 
                // layout pass because of the text reflow logic.  Because of that, we 
                // can just set its height to 0.
                setElementSize(messageDisplay, NaN, 0);
            }
            else
            {
                // grab old textDisplay height before resizing it
                var oldPreferredMessageHeight:Number = getElementPreferredHeight(messageDisplay);
                
                // keep track of oldUnscaledWidth so we have a good guess as to the width 
                // of the messageDisplay on the next measure() pass
                oldUnscaledWidth = unscaledWidth;
                
                // set the width of messageDisplay to messageWidth.
                // set the height to oldMessageHeight.  If the height's actually wrong, 
                // we'll invalidateSize() and go through this layout pass again anyways
                setElementSize(messageDisplay, messageWidth, oldPreferredMessageHeight);
                
                // grab new messageDisplay height after the messageDisplay has taken its final width
                var newPreferredMessageHeight:Number = getElementPreferredHeight(messageDisplay);
                
                // if the resize caused the messageDisplay's height to change (because of 
                // text reflow), then we need to remeasure ourselves with our new width
                if (oldPreferredMessageHeight != newPreferredMessageHeight)
                    invalidateSize();
                
                messageHeight = newPreferredMessageHeight;
            }
            
            // since it's multi-line, no need to truncate
            //if (messageDisplay.isTruncated)
            //    messageDisplay.text = messageText;
            //messageDisplay.truncateToFit();
        }
        
        // Position the text components now that we know all heights so we can respect verticalAlign style
        var totalHeight:Number = 0;
        var labelComponentsY:Number = 0; 
        
        // Heights used in our alignment calculations.  We only care about the "real" ascent 
        var labelAlignmentHeight:Number = 0; 
        var messageAlignmentHeight:Number = 0; 
        
        if (hasLabel)
            labelAlignmentHeight = getElementPreferredHeight(labelDisplay);
        if (hasMessage)
            messageAlignmentHeight = getElementPreferredHeight(messageDisplay);
        
        totalHeight = labelAlignmentHeight + messageAlignmentHeight + verticalGap;			
        labelComponentsY = Math.round(vAlign * (viewHeight - totalHeight)) + paddingTop;
        
        if (labelDisplay)
            setElementPosition(labelDisplay, labelComponentsX, labelComponentsY);
        
        if (messageDisplay)
        {
            var messageY:Number = labelComponentsY + labelAlignmentHeight + verticalGap;
            setElementPosition(messageDisplay, labelComponentsX, messageY);
        }
    }
}
}