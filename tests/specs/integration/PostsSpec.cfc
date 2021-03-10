component extends="tests.resources.BaseIntegrationSpec" {

	function run() {
		describe( "posts", function() {
			it( "shows all the posts in the database with the latest first", function() {
                var author = createUser();
                var otherAuthor = createUser();

                var postA = createPost( author, {
                    "createdDate": dateAdd( "d", -1, now() )
                } );
                var postB = createPost( author, {
                    "createdDate": now()
                } );
                var postC = createPost( otherAuthor, {
                    "createdDate": dateAdd( "d", -3, now() )
                } );
                var postD = createPost( author, {
                    "createdDate": dateAdd( "d", -4, now() )
                } );

                var event = get( "/posts" );

                var prc = event.getPrivateCollection();
                expect( prc ).toHaveKey( "posts" );
                expect( prc.posts ).toBeArray();
                expect( prc.posts ).toHaveLength( 4 );
                expect( prc.posts[ 1 ].isSameAs( postB ) ).toBeTrue( "First post should be postB" );
                expect( prc.posts[ 2 ].isSameAs( postA ) ).toBeTrue( "Second post should be postA" );
                expect( prc.posts[ 3 ].isSameAs( postC ) ).toBeTrue( "Third post should be postC" );
                expect( prc.posts[ 4 ].isSameAs( postD ) ).toBeTrue( "Fourth post should be postD" );
			} );
        } );
    }

    function createUser( struct overrides = {} ) {
        structAppend( arguments.overrides, {
            "firstName": $mockData.firstName(),
            "lastName": $mockData.lastName(),
            "email": $mockData.email(),
            "password": $mockData.string( "string-secure" )
        }, false );
        return getInstance( "User" ).create( arguments.overrides );
    }

    function createPost( required User user, struct overrides = {} ) {
        structAppend( arguments.overrides, {
            "title": $mockData.sentence(),
            "body": $mockData.lorem( "1:3" ),
            "createdDate": now(),
            "modifiedDate": now()
        }, false );
        return arguments.user.posts().create( arguments.overrides );
    }

}
