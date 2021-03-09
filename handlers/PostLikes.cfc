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

}