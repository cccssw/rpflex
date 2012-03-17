package flexUnitTests
{
	import flexunit.framework.Assert;
	import br.com.stimuli.loading.BulkLoader;
	
	public class TestLoader
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testStart():void
		{
			var loader : BulkLoader = new BulkLoader("main-site");
			
			Assert.fail("Test method Not yet implemented");
		}
	}
}