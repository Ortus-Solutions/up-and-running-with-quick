component extends="tests.resources.BaseIntegrationSpec" {

	property name="auth" inject="AuthenticationService@cbauth";

	function run(){
		describe( "sessions", function() {
			beforeEach( function() {
				auth.quietLogout();
			} );

			it( "can log in a user", function() {
				var user = getInstance( "User" ).create( {
                    "firstName": "Jon",
                    "lastName": "Doe",
                    "email" : "jon@example.com",
                    "password" : "1234"
                } );
				expect( auth.check() ).toBeFalse( "The user should be logged out" );
				post( "/login", { "email" : "jon@example.com", password : "1234" } );
				expect( auth.check() ).toBeTrue( "The user should be logged in" );
			} );

			it( "can log a user out", function() {
				var user = getInstance( "User" ).create( {
                    "firstName": "Jon",
                    "lastName": "Doe",
                    "email" : "jon@example.com",
                    "password" : "1234"
                } );
				auth.login( user );
				expect( auth.check() ).toBeTrue( "The user should be logged in" );
				post( "/logout" );
				expect( auth.check() ).toBeFalse( "The user should be logged out" );
			} );
		} );
	}

}
