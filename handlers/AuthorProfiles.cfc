component {

    function show( event, rc, prc ) {
        prc.posts = getInstance( "Post" ).where( "userID", rc.authorID ).get();
        event.setView( "author-profiles/show" );
    }

}