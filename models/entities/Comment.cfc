component extends="quick.models.BaseEntity" accessors="true" {

	property name="id";
	property name="body";
	property name="postId";
	property name="userId";
	property name="createdDate";

    function post() {
        return belongsTo( "Post" );
    }

    function commenter() {
        return belongsTo( "User" );
    }

}