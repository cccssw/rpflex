package com.rpphoto.utils
{
	import flash.events.*;
	import flash.utils.*;
	
	public class DelayCall extends Object
	{
		private var _timer:Timer;
		private var _funciton:Function;
		private var _functionParams:Array;
		
		public function DelayCall(time:Number, callFunction:Function, callFunctionParams:Array = null)
		{
			this._timer = new Timer(time * 1000, 1);
			this._funciton = callFunction;
			this._functionParams = callFunctionParams;
			this._timer.addEventListener(TimerEvent.TIMER, this.onTimer);
			this._timer.start();
			return;
		}// end function
		
		private function onTimer(event:TimerEvent) : void
		{
			this._timer.removeEventListener(TimerEvent.TIMER, this.onTimer);
			this._funciton.apply(this, this._functionParams);
			return;
		}// end function
		
		public function stop() : void
		{
			this._timer.removeEventListener(TimerEvent.TIMER, this.onTimer);
			this._timer.stop();
			return;
		}// end function
		
		public static function call(time:Number, callFunction:Function, callFunctionParams:Array = null) : DelayCall
		{
			return new DelayCall(time, callFunction, callFunctionParams);
		}// end function
		
	}
}