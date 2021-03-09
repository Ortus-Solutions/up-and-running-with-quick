component {

    property name="messagebox" inject="messagebox@cbmessagebox";

    function index( event, rc, prc ) {
        prc.posts = getInstance( "Post" )
            .with( "author" )
            .latest()
            .get();

        event.setView( "posts/index" );
    }

    function new( event, rc, prc ) secured {
        param prc.errors = flash.get( "errors", {} );
        prc.tags = getInstance( "Tag" ).all();
        event.setView( "posts/new" );
    }

    function create( event, rc, prc ) secured {
        param rc.tags = "";

        var result = validate( target = rc, constraints = {
            "title": { "required": true },
            "body": { "required": true },
            "tags": { "required": false }
        } );

        if ( result.hasErrors() ) {
			flash.put( "errors", result.getAllErrorsAsStruct() );
			redirectBack();
			return;
		}

        transaction action="begin" {
            var post = auth().user().posts().create( {
                "title": rc.title,
                "body": rc.body
            } );

            post.tags().sync( rc.tags.listToArray() );
        }


        messagebox.success( 'Your post "#post.getTitle()#" has been created!' );

		relocate( "posts" );
    }

    function show( event, rc, prc ) {
        param prc.errors = flash.get( "errors", {} );
        prc.post = getInstance( "Post" )
            .with( "comments.commenter" )
            .findOrFail( rc.id );
        event.setView( "posts/show" );
    }

    function edit( event, rc, prc ) secured {
        param prc.errors = flash.get( "errors", {} );
        prc.post = auth().user().posts().findOrFail( rc.id );
        event.setView( "posts/edit" );
    }

    function update( event, rc, prc ) secured {
        var post = auth().user().posts().findOrFail( rc.id );

        var result = validate( target = rc, constraints = {
            "title": { "required": true },
            "body": { "required": true }
        } );

        if ( result.hasErrors() ) {
			flash.put( "errors", result.getAllErrorsAsStruct() );
			redirectBack();
			return;
		}

        post.update( {
			"title": rc.title,
			"body": rc.body,
            "modifiedDate": now()
		} );

        messagebox.success( "Your post was successfully updated!" );

        relocate( "posts.#post.getID()#" );
    }

    function delete( event, rc, prc ) {
        var post = auth().user().posts().findOrFail( rc.id );
        post.delete();
        messagebox.info( "Your post was deleted." );
        relocate( "posts" );
    }

}