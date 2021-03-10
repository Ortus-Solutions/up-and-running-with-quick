component extends="coldbox.system.EventHandler" {

	// Default Action
	function index( event, rc, prc ) secured {
		prc.welcomeMessage = "Welcome to ColdBox!";
		event.setView( "main/index" );
	}

    function fourOhFour( event, rc, prc ) {
		event.setView( "main/404" );
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ){
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
        if ( exception.getType() == "ValidationException" ) {
            flash.put( "errors", result.getAllErrorsAsStruct() );
            redirectBack();
		}

        if ( exception.getType() == "EntityNotFound" ) {
			event.setHTTPHeader( statusCode = 404 );
			relocate( event = "404", statusCode = 404 );
		}
	}

}
