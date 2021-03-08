component {
    
    function up( schema, query ) {
        schema.alter( "users", function( table ) {
            table.addColumn( table.string( "firstName" ) );
            table.addColumn( table.string( "lastName" ) );
        } );
    }

    function down( schema, query ) {
        schema.alter( "users", function( table ) {
            table.dropColumn( "firstName" );
            table.dropColumn( "lastName" );
        } );
    }

}
