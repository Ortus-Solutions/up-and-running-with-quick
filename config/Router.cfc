component {

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

        route( "/posts/:postId/likes" )
            .withHandler( "PostLikes" )
            .toAction( {
                "POST": "create",
                "DELETE": "delete"
            } );
        post( "/posts/:postId/comments", "PostComments.create" );
        resources( "posts" );

		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "new", "POST" : "create" } );

		route( "/logout", "sessions.delete" );

		resources( resource = "registrations", only = [ "new", "create" ] );

        route( "/404", "Main.fourOhFour" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
