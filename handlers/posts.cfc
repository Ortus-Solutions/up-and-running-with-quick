component {

    function index( event, rc, prc ) {
        prc.posts = getInstance( "Post" ).all();
        event.setView( "posts/index" );
    }

}