component {

    property name="likeService" inject="quickService:Like";

    function create( event, rc, prc ) {
        var like = variables.likeService.firstOrCreate(
            { "postId": rc.postId, "userId": auth().getUserId() },
            { "createdDate": now() }
        );

        event.renderData(
            statusCode = 201,
            statusText = "Created",
            type = "json",
            data = like.getMemento()
        );
    }

    function delete( event, rc, prc ) {
        variables.likeService
            .where( "postId", rc.postId )
            .where( "userId", auth().getUserId() )
            .deleteAll();

        event.renderData(
            statusCode = 204,
            statusText = "No Content",
            type = "text",
            data = ""
        );
    }

}