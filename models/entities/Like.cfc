component extends="quick.models.BaseEntity" accessors="true" {

    property name="id";
    property name="postId";
    property name="userId";
    property name="createdDate";

    function user() {
        return belongsTo( "User" );
    }

    function post() {
        return belongsTo( "Post" );
    }

}