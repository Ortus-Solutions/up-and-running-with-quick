component {

    function show( event, rc, prc ) {
        prc.author = getInstance( "User" ).findOrFail( rc.authorID );
        prc.posts = prc.author
            .posts()
            .withCount( [ "comments", "likes" ] )
            .get();
        event.setView( "author-profiles/show" );
    }

}