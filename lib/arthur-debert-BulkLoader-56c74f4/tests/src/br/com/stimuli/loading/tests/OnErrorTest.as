package br.com.stimuli.loading.tests {
	import br.com.stimuli.kisstest.TestCase;
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.loadingtypes.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
/**@private*/
	public class OnErrorTest extends TestCase { 
	    public var _bulkLoader : BulkLoader;
		public var lastProgress : Number = 0;

		
		public var errorEvent : Event;
		
		
		public function OnErrorTest(name : String) : void {
		  super(name);
		  this.name = name;
		}
		// Override the run method and begin the request for remote data
		public override function setUp():void {
            _bulkLoader = new BulkLoader(BulkLoader.getUniqueName())
            var goodURL : String = "http://www.emptywhite.com/bulkloader-assets/some-text.txt";
            
	 		_bulkLoader.add(goodURL, {id:"200Item", preventCache: true});
	 		_bulkLoader.add("http://www.emptywhite.com/bulkloader-assets/404file.xml", {id:"404Item",preventCache: true}).addEventListener(BulkLoader.COMPLETE, onGoodURLLoaded, false, 0, true);
	 		
	 		_bulkLoader.addEventListener(BulkLoader.COMPLETE, completeHandler);
	 		_bulkLoader.addEventListener(BulkLoader.PROGRESS, progressHandler);
	 		_bulkLoader.addEventListener(BulkLoader.ERROR, onError);
	 		_bulkLoader.start();
		}

        public function onError(evt : Event) : void{
            errorEvent = evt ;
            //trace("****", evt.target, "current", evt.currentTarget);
            // call the on complete manually 
            if (_bulkLoader.get("200Item").status == LoadingItem.STATUS_FINISHED){
                completeHandler(evt);
                
            }
            
        }
        
        public function onGoodURLLoaded(evt : Event): void{
            if (errorEvent){
                completeHandler(evt);
                
            }
        }
		public function completeHandler(event:Event):void {
			//super.run();
			dispatchEvent(new Event(Event.INIT));
		}
		

		/** This also works as an assertion that event progress will never be NaN
		*/
		 public function progressHandler(event:ProgressEvent):void {
		}
		

		
		override public function tearDown():void {
		    _bulkLoader.clear();
			BulkLoader.removeAllLoaders();
            _bulkLoader = null;	
		}
		
		
        
        public function testItemIsLoaded() : void{
            assertNotNull(_bulkLoader.get("200Item"))
        }
        
        
        public function testHasErrorDispatched() : void{
            assertNotNull(errorEvent);
        }
        
        public function testErrorType() : void{
            assertTrue(errorEvent is ErrorEvent);
        }
        
        public function assertErrorEventTarget() : void{
            
        }
	}
}