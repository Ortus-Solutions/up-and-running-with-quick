component {

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "new", "POST" : "create" } );

		route( "/logout", "sessions.delete" );

		resources( resource = "registrations", only = [ "new", "create" ] );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
