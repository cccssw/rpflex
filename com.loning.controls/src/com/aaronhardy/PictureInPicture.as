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
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.core.UIComponent;
	
	/**
	 * Dispatched when the viewRect changes.
	 */
	[Event(name="viewRectChanged", type="mx.events.Event")]
	
	/**
	 * Dispatched when the bitmap data changes.
	 */
	[Event(name="bitmapDataChanged", type="flash.events.Event")]
	
	/**
	 * A component that provides a visual representation of an image's "viewRect," or in other
	 * words, a specific portion of an image that holds significance.  Usually this is most often 
	 * used in conjuction with the ImageInspector component to denote which portion of a bitmap
	 * is viewable within the ImageInspector and allows users to easily navigate an image. The user 
	 * can modify the viewRect by dragging the thumb.  
	 */
	public class PictureInPicture extends UIComponent
	{
		public static const BITMAP_DATA_CHANGED:String = 'bitmapDataChanged';
		public static const VIEW_RECT_CHANGED:String = 'viewRectChanged';
		
		/**
		 * The bitmap displayed inside the component.
		 */
		protected var bitmap:Bitmap;
		
		/**
		 * The sprite used to denote the viewRect of the bitmap.  This also responds to a user's
		 * drag interactions. 
		 */
		protected var thumb:Sprite;
		
		/**
		 * A simple border shape to go around the outside of the component on top of the bitmap.
		 */
		protected var border:Shape;
		
		//--------------------------------------------------------------
		
		private var _bitmapData:BitmapData;
		private var bitmapDataChanged:Boolean;
		
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
				viewRect = null;
				bitmapDataChanged = true;
				invalidateProperties();
				invalidateSize();
				invalidateDisplayList();
				dispatchEvent(new Event(BITMAP_DATA_CHANGED));
			}
		}
		
		//--------------------------------------------------------------
		
		private var _viewRect:Rectangle;
		
		[Bindable(event="viewRectChanged")]
		/**
		 * A rectangle that denotes a portion of the bitmap that has particular significance.
		 * This is generally to represent which portion of the bitmap is/should be viewable within a
		 * corresponding ImageInspector component.  This can be modified explicitly by setting
		 * it from an external source or by dragging the thumb.  The rectangle is always within the 
		 * bitmap's coordinate space.
		 */
		public function get viewRect():Rectangle
		{
			return _viewRect;
		}
		
		/**
		 * @private
		 */
		public function set viewRect(value:Rectangle):void
		{
			if (_viewRect != value)
			{
				_viewRect = value;
				invalidateDisplayList();
				dispatchEvent(new Event(VIEW_RECT_CHANGED));
			}
		}
		
		//--------------------------------------------------------------
		
		/**
		 * @private
		 */
		override public function set width(value:Number):void
		{
			throw new Error('Please set maxWidth instead.  The component will be sized as large as ' +
				'possible while retaining the original aspect ratio of the image.');
		}
		
		/**
		 * @private
		 */
		override public function set height(value:Number):void
		{
			throw new Error('Please set maxHeight instead.  The component will be sized as large as ' +
				'possible while retaining the original aspect ratio of the image.');
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
			
			border = new Shape();
			addChild(border);
			
			thumb = new Sprite();
			thumb.addEventListener(MouseEvent.MOUSE_DOWN, thumb_mouseDownHandler);
			addChild(thumb);
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
			
			const DEFAULT_WIDTH:Number = 150;
			const DEFAULT_HEIGHT:Number = 150;
			
			// If no maxWidth/Height were explicitly set, we'll use our own defaults.
			var maxWidth:Number = !isNaN(explicitMaxWidth) ? maxWidth : DEFAULT_WIDTH;
			var maxHeight:Number = !isNaN(explicitMaxHeight) ? maxHeight : DEFAULT_HEIGHT;
			
			// Make the component as large as possible while maintaining the original aspect
			// ratio of the image.
			if (bitmapData)
			{
				var neededScale:Number = Math.min(
						maxWidth / bitmapData.width,
						maxHeight / bitmapData.height);
				measuredWidth = bitmapData.width * neededScale;
				measuredHeight = bitmapData.height * neededScale;
			}
			else
			{
				measuredWidth = DEFAULT_WIDTH;
				measuredHeight = DEFAULT_HEIGHT;
			}
		}
		
		/**
		 * @private
		 */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			updateBorder();
			
			// Make the bitmap the full size of the component.  By doing so, this decreases
			// the complexity of the component but can only be achieved if the measured width
			// and measured height are used.  While the width and height setters throw an error
			// if invoked, a parent component could still potentially ignore this component's
			// measured dimensions and specify arbitrary dimensions which could throw things off.
			bitmap.width = unscaledWidth;
			bitmap.height = unscaledHeight;
			
			updateThumb();
		}
		
		/**
		 * Draws a simple border around the component.
		 */
		protected function updateBorder():void
		{
			var g:Graphics = border.graphics;
			g.clear();
			g.lineStyle(1);
			// Since a standard 1 pixel vector stroke stradles what would be a pixel boundary,
			// we would get some funky results if we did not adjust for it.  Sometimes the stroke
			// would be outside the component, for example.  By adjusting by a half-pixel, we
			// ensure the stroke will lie directly on a column/row of pixels within the component
			// boundaries.
			g.drawRect(.5, .5, unscaledWidth - 1, unscaledHeight - 1);
		}
		
		/**
		 * Updates the thumb size and position based off the current viewRect.
		 */
		protected function updateThumb():void
		{
			if (viewRect)
			{
				var sanitizedRect:Rectangle = sanitizeViewRect(viewRect);
				
				// If any changes occurred while sanitizing the view rect, we need to update
				// our viewRect property and update any bindings.
				if (!rectsEqualRounded(sanitizedRect, viewRect))
				{
					_viewRect = sanitizedRect;
					dispatchEvent(new Event(VIEW_RECT_CHANGED));
				}
				
				updateThumbSize(viewRect);
				updateThumbPosition(viewRect);
			}
			else
			{
				thumb.graphics.clear();
			}
		}
		
		/**
		 * Updates the size of the thumb.
		 * @param sanitizedViewRect A view rect that has already been sanitized to ensure it's
		 *        within the bounds of the image.
		 */
		protected function updateThumbSize(sanitizedViewRect:Rectangle):void
		{
			var g:Graphics = thumb.graphics;
			g.clear();
			g.lineStyle(1, 0x000000);
			g.beginFill(0xffffff, .3);
			// Since a standard 1 pixel vector stroke stradles what would be a pixel boundary,
			// we would get some funky results if we did not adjust for it.  Sometimes the stroke
			// would be outside the component, for example.  By adjusting by a half-pixel, we
			// ensure the stroke will lie directly on a column/row of pixels within the component
			// boundaries.
			g.drawRect(.5, .5, 
					sanitizedViewRect.width * bitmap.scaleX - 1, 
					sanitizedViewRect.height * bitmap.scaleY - 1);
			g.endFill();
		}
		
		/**
		 * Updates the position of the thumb.
		 * @param sanitizedViewRect A view rect that has already been sanitized to ensure it's
		 *        within the bounds of the image.
		 */
		protected function updateThumbPosition(sanitizedViewRect:Rectangle):void
		{
			thumb.x = sanitizedViewRect.x * bitmap.scaleX;
			thumb.y = sanitizedViewRect.y * bitmap.scaleY;
		}
		
		/**
		 * Ensures a view rect is (1) smaller than the full dimensions of the bitmap and 
		 * (2) within the dimensions of the bitmap.
		 */
		protected function sanitizeViewRect(rect:Rectangle):Rectangle
		{
			var rect:Rectangle = rect.clone();
			rect.width = clamp(rect.width, 1, bitmapData.width);
			rect.height = clamp(rect.height, 1, bitmapData.height);
			rect.x = clamp(rect.x, 0, bitmapData.width - rect.width);
			rect.y = clamp(rect.y, 0, bitmapData.height - rect.height);
			return rect;
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
		
		//--------------------------------------------------------------
		// Interaction Handling
		//--------------------------------------------------------------
		
		/**
		 * Where, in the bitmap's coordinate space, did the user mouse down most recently.
		 */
		protected var thumbDownPointInBitmap:Point;
		
		/**
		 * Where, relative to the view rect's registration, did the user mouse down most recently.
		 */
		protected var thumbDownPointInViewRect:Point;
		
		/**
		 * Handle a mouse-down on the thumb.
		 */
		protected function thumb_mouseDownHandler(event:MouseEvent):void
		{
			thumbDownPointInBitmap = bitmap.globalToLocal(new Point(event.stageX, event.stageY));
			thumbDownPointInViewRect = thumbDownPointInBitmap.subtract(new Point(viewRect.x, viewRect.y));
			stage.addEventListener(MouseEvent.MOUSE_MOVE, thumb_mouseMoveHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, thumb_mouseUpHandler);
		}
		
		/**
		 * Handle a mouse-move (drag) after mousing down on the thumb.
		 */
		private function thumb_mouseMoveHandler(event:MouseEvent):void
		{
			if(viewRect){
				var pointInBitmap:Point = bitmap.globalToLocal(new Point(event.stageX, event.stageY));
				var rect:Rectangle = new Rectangle(
						pointInBitmap.x - thumbDownPointInViewRect.x,
						pointInBitmap.y - thumbDownPointInViewRect.y,
						viewRect.width,
						viewRect.height);
				_viewRect = sanitizeViewRect(rect);
				dispatchEvent(new Event(VIEW_RECT_CHANGED));
				
				// We're calling updateThumb directly instead of going through updateDisplayList()
				// for optimization.
				updateThumbPosition(viewRect);
			}
		}

		/**
		 * Handle a mouse-up after mousing down on the thumb.
		 */
		private function thumb_mouseUpHandler(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, thumb_mouseMoveHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, thumb_mouseUpHandler);
		}
	}
}