component {
    
    function up( schema, query ) {
        schema.alter( "posts", function( table ) {
            table.addColumn( table.datetime( "publishedDate" ).nullable() );
        } );
    }

    function down( schema, query ) {
        schema.alter( "posts", function( table ) {
            table.dropColumn( "publishedDate" );
        } );
    }

}
