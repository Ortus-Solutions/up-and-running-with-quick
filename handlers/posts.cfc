component {

    function index( event, rc, prc ) {
        prc.posts = getInstance( "Post" ).all();
        event.setView( "posts/index" );
    }

    function new( event, rc, prc ) secured {
        param prc.errors = flash.get( "errors", {} );
        event.setView( "posts/new" );
    }

}