package spark.components
{
import spark.core.IDisplayText;

public class ListForm extends List
{
    [SkinPart(required="false")]
    public var titleDisplay:IDisplayText;
    
    public function ListForm()
    {
        super();
    }
    
    
    //----------------------------------
    //  title
    //----------------------------------
    
    /**
     *  @private
     */
    private var _title:String = "";
    
    /**
     *  @private
     */
    private var titleChanged:Boolean;
    
    [Bindable]
    [Inspectable(category="General", defaultValue="")]
    
    /**
     *  Title or caption displayed in the title bar. 
     *
     *  @default ""
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 1.5
     *  @productversion Flex 4
     */
    public function get title():String 
    {
        return _title;
    }
    
    /**
     *  @private
     */
    public function set title(value:String):void 
    {
        _title = value;
        
        if (titleDisplay)
            titleDisplay.text = title;
    }
    
    override protected function partAdded(partName:String, instance:Object):void
    {
        super.partAdded(partName, instance);
        
        if (instance == titleDisplay)
        {
            titleDisplay.text = title;
        }
    }
}
}