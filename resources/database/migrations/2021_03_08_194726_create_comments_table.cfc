component {

    function up( schema, query ) {
        schema.create( "comments", function( table ) {
            table.increments( "id" );
            table.text( "body" );
            table.unsignedInteger( "postId" )
                .references( "id" )
                .onTable( "posts" )
                .onDelete( "CASCADE" );
            table.unsignedInteger( "userId" )
                .references( "id" )
                .onTable( "users" )
                .onDelete( "CASCADE" );
            table.timestamp( "createdDate" );
        } );
    }

    function down( schema, query ) {
        schema.drop( "comments" );
    }

}
