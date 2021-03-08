component {

	property name="auth" inject="AuthenticationService@cbauth";
	property name="flash" inject="coldbox:flash";

	function new( event, rc, prc ){
		param prc.errors = flash.get( "login_form_errors", {} );
		event.setView( "sessions/new" );
	}

	function create( event, rc, prc ){
		var result = validateModel(
			target = rc,
			constraints = { "email" : { "required" : true, "type" : "email" }, "password" : { "required" : true } }
		);

		if ( result.hasErrors() ) {
			flash.put( "login_form_errors", result.getAllErrorsAsStruct() );
			redirectBack();
			return;
		}

		try{
			auth.authenticate( rc.email, rc.password );
			relocate( uri = "/" );
		} catch ( InvalidCredentials e ) {
			flash.put( "login_form_errors", { "login" : "Invalid Credentials" } );
			redirectBack();
		}
	}

	function delete( event, rc, prc ){
		auth.logout();
		relocate( uri = "/" );
	}

}
