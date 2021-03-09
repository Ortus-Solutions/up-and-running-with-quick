component {
    
    function up( schema, query ) {
        schema.create( "posts_tags", function( table ) {
            table.unsignedInteger( "postId" )
                .references( "id" )
                .onTable( "posts" )
                .onDelete( "CASCADE" );
            table.unsignedInteger( "tagId" )
                .references( "id" )
                .onTable( "tags" )
                .onDelete( "CASCADE" );
            table.primaryKey( [ "postId", "tagId" ] );
        } );
    }

    function down( schema, query ) {
        schema.drop( "posts_tags" );
    }

}
