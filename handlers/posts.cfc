component {

    property name="messagebox" inject="messagebox@cbmessagebox";

    function index( event, rc, prc ) {
        prc.posts = getInstance( "Post" )
            .orderByDesc( "createdDate" )
            .get();

        event.setView( "posts/index" );
    }

    function new( event, rc, prc ) secured {
        param prc.errors = flash.get( "errors", {} );
        event.setView( "posts/new" );
    }

    function create( event, rc, prc ) secured {
        var result = validate( target = rc, constraints = {
            "title": { "required": true },
            "body": { "required": true }
        } );

        if ( result.hasErrors() ) {
			flash.put( "errors", result.getAllErrorsAsStruct() );
			redirectBack();
			return;
		}

        var post = getInstance( "Post" ).create( {
			"title": rc.title,
			"body": rc.body,
            "userId": auth().getUserId()
		} );

        messagebox.success( 'Your post "#post.getTitle()#" has been created!' );

		relocate( "posts" );
    }

    function show( event, rc, prc ) {
        prc.post = getInstance( "Post" ).findOrFail( rc.id );
        event.setView( "posts/show" );
    }

    function edit( event, rc, prc ) secured {
        param prc.errors = flash.get( "errors", {} );
        prc.post = getInstance( "Post" ).findOrFail( rc.id );
        cbsecure().secureWhen( function( user ) {
            return prc.post.getUserID() != user.getID();
        } );
        event.setView( "posts/edit" );
    }

}