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

}
