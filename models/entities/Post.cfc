component extends="quick.models.BaseEntity" accessors="true" {

	property name="id";
	property name="title";
	property name="body";
    property name="userId";
    property name="createdDate";
    property name="modifiedDate";
    property name="publishedDate";

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
        qb.orderByRaw( "COALESCE(publishedDate, createdDate) DESC" );
    }

    function scopeAddAuthorName( qb ) {
        qb.addSubselect( "authorName", function( q ) {
            return q.selectRaw( "CONCAT(firstName, ' ', lastName) AS fullName" )
                .from( "users" )
                .whereColumn( "users.id", "posts.userId" );
        } );
    }

    function scopePublished( qb ) {
        qb.whereNull( "publishedDate" );
        qb.orWhere( "publishedDate", "<=", now() );
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
