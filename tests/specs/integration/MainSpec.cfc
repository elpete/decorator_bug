component extends="coldbox.system.testing.BaseTestCase" appMapping="/root" {

	function run(){
		describe( "controller decorator bug", function() {
			it( "can show the controller decorator bug while relocating", function(){
				// toggle the `controllerDecorator` setting in `config/ColdBox.cfc` to see the bug
				// when a Controller Decorator is specified, the test will actually try to redirect.
				var event = execute( event = "main.doSomething" );
				expect( event.getValue( "relocate_event", "" ) ).toBe( "main.index" );
			} );
		} );
	}

}
