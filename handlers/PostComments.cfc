component secured {

    property name="postService" inject="quickService:Post";
    property name="messagebox" inject="messagebox@cbmessagebox";

    function create( event, rc, prc ) {
        var post = variables.postService.findOrFail( rc.postId );

        var valid = validateOrFail( target = rc, constraints = {
            "body": { "required": true }
        } );

        post.comments().create( {
            "userId": auth().getUserId(),
            "body": valid.body
        } );

        variables.messagebox.success( "Your comment was successfully submitted." );

        relocate( "posts.#post.getID()#" );
    }

}
