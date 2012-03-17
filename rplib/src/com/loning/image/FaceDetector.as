package com.loning.image
{
	import com.quasimondo.bitmapdata.CameraBitmap;
	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import jp.maaash.ObjectDetection.ObjectDetector;
	import jp.maaash.ObjectDetection.ObjectDetectorEvent;
	import jp.maaash.ObjectDetection.ObjectDetectorOptions;
	
	public class FaceDetector
	{
		private var detector:ObjectDetector;
		private var options:ObjectDetectorOptions;
		private var detectionMap:BitmapData;
		private var drawMatrix:Matrix;
		public var scaleFactor:int = 8;
		
		public var rects:Vector.<Rectangle>;
		
		public function FaceDetector()
		{
			
			drawMatrix = new Matrix( 1 / scaleFactor, 0, 0, 1 / scaleFactor );
			detector = new ObjectDetector();
			var options:ObjectDetectorOptions = new ObjectDetectorOptions();
			detector.options = options;
			detector.addEventListener( ObjectDetectorEvent.DETECTION_COMPLETE, detectionHandler );
			rects=new Vector.<Rectangle>();
		}
		
		public function detect(bitmapdata:BitmapData):Boolean{
			detectionMap = new BitmapData( 
				bitmapdata.width / scaleFactor, bitmapdata.height / scaleFactor, false, 0 );
			detectionMap.draw( bitmapdata, drawMatrix, null, "normal", null, true );
			return detector.detect( detectionMap );
		}
		
		private function detectionHandler( e:ObjectDetectorEvent ):void
		{
			rects=new Vector.<Rectangle>();
			if ( e.rects &&e.rects.length>0 )
			{
				for(var idx:int=0;idx<e.rects.length;idx++){
					var r:Rectangle=e.rects[idx];
					var rect:Rectangle=new Rectangle(
						r.x * scaleFactor, r.y * scaleFactor, r.width * scaleFactor, r.height * scaleFactor);
					this.rects.push(rect);
				}
			}
		}
		
		
	}
}