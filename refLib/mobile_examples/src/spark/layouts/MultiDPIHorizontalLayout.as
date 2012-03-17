package spark.layouts
{
import mx.core.DPIClassification;
import mx.core.FlexGlobals;

import spark.layouts.HorizontalLayout;

/**
 * Applies application scale factor to HorizontalLayout parameters
 */
public class MultiDPIHorizontalLayout extends HorizontalLayout
{
    public function MultiDPIHorizontalLayout()
    {
        super();
    }
    
    public var sourceDPI:Number = DPIClassification.DPI_160;
    
    protected function get dpiScale():Number
    {
        return FlexGlobals.topLevelApplication.runtimeDPI / sourceDPI;
    }
    
    override public function get columnWidth():Number
    {
        return super.columnWidth * dpiScale;
    }
    
    override public function get gap():int
    {
        return super.gap * dpiScale;
    }
    
    override public function get paddingLeft():Number
    {
        return super.paddingLeft * dpiScale;
    }
    
    override public function get paddingRight():Number
    {
        return super.paddingRight * dpiScale;
    }
    
    override public function get paddingTop():Number
    {
        return super.paddingTop * dpiScale;
    }
    
    override public function get paddingBottom():Number
    {
        return super.paddingBottom * dpiScale;
    }
    
}
}