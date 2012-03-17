// Copyright (c) 2010 Aaron Hardy - http://aaronhardy.com
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.

package com.aaronhardy
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.core.UIComponent;
	
	/**
	 * Dispatched when the relative scale of the image changes either directly by setting
	 * relativeScale or indirectly by changing viewRect.
	 */
	[Event(name="relativeScaleChanged", type="flash.events.Event")]
	
	/**
	 * Dispatched when the viewRect changes.
	 */
	[Event(name="viewRectChanged", type="flash.events.Event")]
	
	/**
	 * Dispatched when the bitmap data changes.
	 */
	[Event(name="bitmapDataChanged", type="flash.events.Event")]
	
	/**
	 * A component that displays an image or portion of an image based on a relative scale
	 * or a specific view rectangle.  Most often used in conjunction with the PictureInPicture
	 * component to give users the ability to easily navigate an image.
	 */
	public class ImageInspector extends UIComponent
	{
		public static const RELATIVE_SCALE_CHANGED:String = 'relativeScaleChanged'; 
		public static const VIEW_RECT_CHANGED:String = 'viewRectChanged';
		public static const BITMAP_DATA_CHANGED:String = 'bitmapDataChanged';
		
		/**
		 * The bitmap displayed inside the component.
		 */
		protected var bitmap:Bitmap;
		
		/**
		 * The shape used to mask portions of the bitmap that lie outside the component's bounds.
		 */
		protected var clipMask:Shape;
		
		//--------------------------------------------------------------
		
		private var _bitmapData:BitmapData;
		private var bitmapDataChanged:Boolean = false;
		
		[Bindable(event="bitmapDataChanged")]
		/**
		 * The bitmap data to display in the component.
		 * 
		 * @default null
		 */
		public function get bitmapData():BitmapData
		{
			return _bitmapData;
		}
		
		/**
		 * @private
		 */
		public function set bitmapData(value:BitmapData):void
		{
			if (_bitmapData != value)
			{
				_bitmapData = value;
				
				explicitRelativeScale = NaN;
				implicitRelativeScale = 1;
				dispatchEvent(new Event(RELATIVE_SCALE_CHANGED));
				
				explicitViewRect = null;
				implicitViewRect = null;
				dispatchEvent(new Event(VIEW_RECT_CHANGED));
				
				bitmapDataChanged = true;
				invalidateProperties();
				invalidateSize();
				invalidateDisplayList();
				dispatchEvent(new Event(BITMAP_DATA_CHANGED));
			}
		}
		
		//--------------------------------------------------------------
		
		/**
		 * Holds the current relative scale of the bitmap. If relativeScale was explicity set,
		 * this will generally be the same value.  However, if no relativeScale was explicitly
		 * set, this will be the calculated relative scale based on the current viewRect.
		 */
		protected var implicitRelativeScale:Number = 1;
		
		/**
		 * Holds the relative scale that was last explicitly set.  Note that this is set back
		 * to NaN whenever viewRect is explicitly set.
		 */
		protected var explicitRelativeScale:Number;
		
		[Bindable(event="relativeScaleChanged")]
		/**
		 * The relative scale of the bitmap displayed.  A relative scale of one means the image
		 * will fit within the viewable area.  The aspect ratio will never change.
		 * Regardless of whether relative scale is explicitly set, it's always updated and publicly
		 * available.
		 * 
		 * @default 1
		 */
		public function get relativeScale():Number
		{
			return isNaN(implicitRelativeScale) ? explicitRelativeScale : implicitRelativeScale;
		}
		
		/**
		 * @private
		 */
		public function set relativeScale(value:Number):void
		{
			if (explicitRelativeScale != value)
			{
				explicitRelativeScale = value;
				invalidateDisplayList();
				dispatchEvent(new Event(RELATIVE_SCALE_CHANGED));
			}		
		}
		
		//--------------------------------------------------------------
		
		protected var implicitViewRect:Rectangle;
		protected var explicitViewRect:Rectangle;
		
		[Bindable(event="viewRectChanged")]
		/**
		 * A rectangle that represents the viewable area of the bitmap data within the bitmap's
		 * coordinate space.  Regardless of whether viewRect is explicitly set, it's always
		 * updated and publicly available.
		 * 
		 * @default null
		 */
		public function get viewRect():Rectangle
		{
			return implicitViewRect ? implicitViewRect : explicitViewRect;
		}
		
		/**
		 * @private
		 */
		public function set viewRect(value:Rectangle):void
		{
			if (explicitViewRect != value)
			{
				explicitViewRect = value;
				implicitViewRect = null;
				explicitRelativeScale = NaN;
				invalidateDisplayList();
				dispatchEvent(new Event(VIEW_RECT_CHANGED));
			}
		}
		
		//--------------------------------------------------------------
		
		/**
		 * @private
		 */
		override protected function createChildren():void
		{
			super.createChildren();
			
			bitmap = new Bitmap();
			addChild(bitmap);
			
			clipMask = new Shape();
			addChild(clipMask);
			mask = clipMask;
		}
		
		/**
		 * @private
		 */
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (bitmapDataChanged)
			{
				bitmap.bitmapData = bitmapData;
				bitmap.smoothing = true;
				bitmapDataChanged = false;
			}
		}
		
		/**
		 * @private
		 */
		override protected function measure():void
		{
			super.measure();
			measuredWidth = bitmapData ? bitmapData.width : 200;
			measuredHeight = bitmapData ? bitmapData.height : 200;
		}
		
		/**
		 * @private
		 */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			if (!bitmapData)
			{
				return;
			}
			
			updateBitmapScale();
			updateBitmapPosition();
			updateClipMask();
			updateViewRect();
		}
		
		/**
		 * Scales the bitmap.
		 */
		protected function updateBitmapScale():void
		{
			// The scale that will be applied to the bitmap.
			var absoluteScale:Number;
			
			// If an explicit relative scale was specified, derive an absolute scale from it.
			if (!isNaN(explicitRelativeScale))
			{
				absoluteScale = relativeToAbsoluteScale(explicitRelativeScale);
			}
			// Otherwise, if an explicit view rect was specified, derive an absolute scale from it.
			else if (explicitViewRect)
			{
				absoluteScale = Math.min(
					unscaledWidth / explicitViewRect.width,
					unscaledHeight / explicitViewRect.height);
				absoluteToRelativeScale(absoluteScale);
			}
			// Otherwise, use the last used relative scale.  If no relative scale was previously
			// calculated, implicitRelativeScale will still be at the default (1).  If a relative
			// scale was previously calculated, this is nice to have when the component is resizing
			// so that the image scale relatively along with it.
			else
			{
				absoluteScale = relativeToAbsoluteScale(implicitRelativeScale);
			}
			
			// Ensure the image is never scaled under the bounds of the component (1 relative scale).
			// The image should always be touching the left and right side, the top and bottom
			// sides, or all four.
			absoluteScale = Math.max(absoluteScale, relativeToAbsoluteScale(1));
			
			var oldImplicitRelativeScale:Number = implicitRelativeScale;
			implicitRelativeScale = absoluteToRelativeScale(absoluteScale);
			
			// If the implicit relative scale is changing, update our relativeScale bindings.
			if (oldImplicitRelativeScale != implicitRelativeScale)
			{
				dispatchEvent(new Event(RELATIVE_SCALE_CHANGED));
			}
			
			bitmap.scaleX = bitmap.scaleY = absoluteScale;
		}
		
		/**
		 * Positions the bitmap.
		 */
		protected function updateBitmapPosition():void
		{
			var proposedX:Number;
			var proposedY:Number;
			
			// If an explicit view rect has been set or an implicit view rect has been calculated,
			// use it for positioning first.
			if (explicitViewRect || implicitViewRect)
			{
				// Give priority to the explicit view rect if one has been set.
				// Try to position the bitmap so that the center of the view rect will be in the
				// middle of the component.
				var anchorRect:Rectangle = explicitViewRect || implicitViewRect;
				var viewRectCenterX:Number = (anchorRect.x + anchorRect.width / 2) * bitmap.scaleY;
				var viewRectCenterY:Number = (anchorRect.y + anchorRect.height / 2) * bitmap.scaleY;
				proposedX = -viewRectCenterX + unscaledWidth / 2;
				proposedY = -viewRectCenterY + unscaledHeight / 2;
			}
			// Otherwise, just center the bitmap.
			else
			{
				proposedX = unscaledWidth / 2 - bitmap.width / 2;
				proposedY = unscaledHeight / 2 - bitmap.height / 2;
			}
			
			// If the width of the bitmap is larger than/equal to the width of the component, then 
			// there should ever be whitespace width-wise.
			if (bitmap.width >= unscaledWidth)
			{
				proposedX = clamp(proposedX, unscaledWidth - bitmap.width, 0);
			}
			// And if the width is smaller, we'll always center it.
			else
			{
				proposedX = unscaledWidth / 2 - bitmap.width / 2;
			}
			
			// If the height of the bitmap is larger than/equal to the height of the component, then 
			// there should ever be whitespace height-wise.
			if (bitmap.height >= unscaledHeight)
			{
				proposedY = clamp(proposedY, unscaledHeight - bitmap.height, 0);
			}
			// And if the height is smaller, we'll always center it.
			else
			{
				proposedY = unscaledHeight / 2 - bitmap.height / 2;
			}
			
			bitmap.x = proposedX;
			bitmap.y = proposedY;
		}
		
		/**
		 * Converts a relative scale to an absolute scale. Absolute scale is the scale that should
		 * be used for the bitmap to achieve a specified relative scale.
		 * @param relativeScale The relative scale for which to get an absolute scale.
		 * @see #relativeScale
		 */
		protected function relativeToAbsoluteScale(relativeScale:Number):Number
		{
			var originScale:Number = Math.min(
					unscaledWidth / bitmapData.width,
					unscaledHeight / bitmapData.height);
			return relativeScale * originScale;
		}
		
		/**
		 * Converts an absolute scale to a relative scale. In other words, if the scale value
		 * were used on the current bitmap, what relative scale would result?
		 * @param relativeScale The absolute scale for which to get a relative scale.
		 * @see #relativeScale
		 */
		protected function absoluteToRelativeScale(absoluteScale:Number):Number
		{
			return absoluteScale / relativeToAbsoluteScale(1);
		}
		
		/**
		 * Updates the implicit view rect to reflect the portion of the image that's actually
		 * being shown.
		 */
		protected function updateViewRect():void
		{
			// Remember the viewRect is always in the bitmap's coordinate space.
			var topLeft:Point = localToLocal(this, bitmap, new Point());
			topLeft.x = clamp(topLeft.x, 0, bitmapData.width);
			topLeft.y = clamp(topLeft.y, 0, bitmapData.height);
			
			var bottomRight:Point = localToLocal(this, bitmap, new Point(width, height));
			bottomRight.x = clamp(bottomRight.x, 0, bitmapData.width);
			bottomRight.y = clamp(bottomRight.y, 0, bitmapData.height);
			
			var rect:Rectangle = new Rectangle();
			rect.x = topLeft.x;
			rect.y = topLeft.y;
			rect.width = bottomRight.x - topLeft.x;
			rect.height = bottomRight.y - topLeft.y;
			
			// Only set the calculated view rect and dispatch an event if it's actually changing.
			if (!implicitViewRect || !rectsEqualRounded(rect, implicitViewRect))
			{
				implicitViewRect = rect;
				dispatchEvent(new Event(VIEW_RECT_CHANGED));
			}
		}
		
		/**
		 * Sizes the clip mask to the full size of the component.
		 */
		protected function updateClipMask():void
		{
			var g:Graphics = clipMask.graphics;
			g.clear();
			g.beginFill(0xffffff, 1);
			g.drawRect(0, 0, unscaledWidth, unscaledHeight);
			g.endFill();
		}
		
		/**
		 * Ensures a value is within a specific range.
		 * @param value The value to force to a given range.
		 * @param min The lower bounds of the allowed range.
		 * @param max The upper bounds of the allowed range.
		 * @return The value after having been forced to a given range.
		 */
		protected function clamp(value:Number, min:Number, max:Number):Number
		{
			return Math.max(Math.min(value, max), min);
		}
		
		/**
		 * Converts a point from one display object to another.
		 * @param containerFrom The display object to convert from.
		 * @param containerTo The display object to convert to.
		 * @return The point in the destination display object's coordinate space.
		 */
		public function localToLocal(containerFrom:DisplayObject, containerTo:DisplayObject,
											point:Point):Point
		{
			return containerTo.globalToLocal(containerFrom.localToGlobal(point));
		}
		
		/**
		 * Evaluates whether two rectangles are equal.  It's slightly more liberal than
		 * Rectangle.equals() because it rounds the values before comparing.  This helps avoid 
		 * recursion issues between the ImageInspector and PictureInPicture components due to 
		 * decimal differences that aren't significant in the UI anyway.
		 * 
		 * @param rect1 The first rectangle to compare.
		 * @param rect2 The second rectangle to compare.
		 * @return Whether the rectangles are equal.
		 */
		private function rectsEqualRounded(rect1:Rectangle, rect2:Rectangle):Boolean
		{
			return Math.round(rect1.x) == Math.round(rect2.x) &&
					Math.round(rect1.y) == Math.round(rect2.y) &&
					Math.round(rect1.width) == Math.round(rect2.width) &&
					Math.round(rect1.height) == Math.round(rect2.height);
		}
		
		public function getViewBitmapData():BitmapData{
			trace("start getViewBitmapData");
			
			var rect:Rectangle=this.viewRect;
			trace('viewRect',rect,'source',this.bitmapData.width);
			var bmpd:BitmapData=new BitmapData(
				rect.width,rect.height);
			bmpd.copyPixels(
				this.bitmapData,rect,new Point(0,0));
			trace("end getViewBitmapData");
			return bmpd;
		}
	}
}