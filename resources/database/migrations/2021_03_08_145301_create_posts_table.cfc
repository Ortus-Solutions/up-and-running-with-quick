component {
    
    function up( schema, query ) {
        schema.create( "posts", function( table ) {
            table.increments( "id" );
            table.unicodeString( "title" );
            table.unicodeLongText( "body" );
            table.unsignedInteger( "userId" )
                .references( "id" )
                .onTable( "users" )
                .onDelete( "RESTRICT" );
            table.datetime( "createdDate" ).withCurrent();
            table.datetime( "modifiedDate" ).withCurrent();
        } );
    }

    function down( schema, query ) {
        schema.drop( "posts" );
    }

}
