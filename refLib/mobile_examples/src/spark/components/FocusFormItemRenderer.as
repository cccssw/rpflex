package spark.components
{
import spark.components.supportClasses.ToggleButtonBase;

/**
 *  Item render that sets focus on it's content when in the down state.
 */
public class FocusFormItemRenderer extends ListFormItemRenderer
{
    public function FocusFormItemRenderer()
    {
        super();
    }
    
    override protected function set down(value:Boolean):void
    {
        super.down = value;
        
        if (down && content)
            content.setFocus();
    }
}
}