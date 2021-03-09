component extends="quick.models.BaseEntity" accessors="true" {

	property name="id";
	property name="title";
	property name="body";
    property name="userId";
    property name="createdDate";
    property name="modifiedDate";

    function author() {
        return belongsTo( "User" );
    }

    function comments() {
        return hasMany( "Comment" );
    }

    function tags() {
        return belongsToMany( "Tag" );
    }

    function likes() {
        return hasMany( "Like" );
    }

    function scopeLatest( qb ) {
        qb.orderByDesc( "createdDate" );
    }

    public boolean function hasTag( required Tag tag ) {
        return this.getTags().filter( function( t ) {
            return t.getID() == tag.getID();
        } ).len();
    }

    public boolean function hasLikeFrom( required User user ) {
        return this.getLikes().filter( function( l ) {
            return l.getUserID() == user.getID();
        } ).len();
    }

}
