package com.loning.image
{
	public class FaceElement
	{
		public var id:String;
		public var des:String;
		public var type:String;
		public var weight:Number;
		public var ctg:String;
		public var rps:int;
		public var rpe:int;
		public function FaceElement(
			id:String,des:String,type:String,weight:Number,ctg:String,rps:int,rpe:int){
			this.id		= id;
			this.des	= des;
			this.type	= type;
			this.weight	= weight;
			this.ctg	= ctg;
			this.rps	= rps;
			this.rpe	= rpe;
		}
	}
}