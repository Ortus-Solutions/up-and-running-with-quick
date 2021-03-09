component {

    function show( event, rc, prc ) {
        prc.author = getInstance( "User" ).findOrFail( rc.authorID );
        prc.posts = prc.author.posts().latest().get();
        event.setView( "author-profiles/show" );
    }

}