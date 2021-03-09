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

    function scopeLatest( qb ) {
        qb.orderByDesc( "createdDate" );
    }

    public boolean function hasTag( required Tag tag ) {
        return this.getTags().filter( function( t ) {
            return t.getID() == tag.getID();
        } ).len();
    }

}
