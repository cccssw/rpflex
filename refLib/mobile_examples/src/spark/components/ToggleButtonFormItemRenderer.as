package spark.components
{
import mx.core.UIComponent;

import spark.components.supportClasses.ToggleButtonBase;

/**
 *  Item render that toggles the selected state of it's ToggleButtonBase 
 *  content
 */
public class ToggleButtonFormItemRenderer extends ListFormItemRenderer
{
    public function ToggleButtonFormItemRenderer()
    {
        super();
    }
    
    override protected function set down(value:Boolean):void
    {
        super.down = value;
        
        var toggle:ToggleButtonBase = content as ToggleButtonBase;
        if (down && toggle)
            toggle.selected = !toggle.selected;
    }
    
    override public function set content(value:UIComponent):void
    {
        super.content = value;
        
        // disable mouse interaction on toggle buttons, let the item renderer
        // down state handle this
        var toggle:ToggleButtonBase = content as ToggleButtonBase;
        if (toggle)
            toggle.mouseEnabled = false;
    }
}
}