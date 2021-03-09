component {
    
    function up( schema, query ) {
        schema.create( "likes", function( table ) {
            table.increments( "id" );
            table.unsignedInteger( "postId" )
                .references( "id" )
                .onTable( "posts" )
                .onDelete( "CASCADE" );
            table.unsignedInteger( "userId" )
                .references( "id" )
                .onTable( "users" )
                .onDelete( "CASCADE" );
            table.datetime( "createdDate" ).withCurrent();
            table.index( [ "postId", "userId" ] );
        } );
    }

    function down( schema, query ) {
        schema.drop( "likes" );
    }

}
