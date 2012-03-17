package com.sina.microblog.data
{
	/**
	 * MicroBlogUsersRelationship是一个数据封装类(Value Object)，用于返回两个用户之间的关系
	 */ 
	public class MicroBlogUsersRelationship
	{
		/**
		 * 查询的源用户
		 */
		public var source:MicroBlogRelationshipDescriptor;
		/**
		 * 查询的目标用户
		 */
		public var target:MicroBlogRelationshipDescriptor;
		public function MicroBlogUsersRelationship(relationship:XML)
		{
			source = new MicroBlogRelationshipDescriptor(relationship.source[0]);
			target = new MicroBlogRelationshipDescriptor(relationship.target[0]);
		}
	}
}