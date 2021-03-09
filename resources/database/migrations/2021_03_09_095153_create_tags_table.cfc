component {
    
    function up( schema, query ) {
        schema.create( "tags", function( table ) {
            table.increments( "id" );
            table.string( "name" );
        } );

        query.table( "tags" ).insert( [
            { "name": "programming" },
            { "name": "music" },
            { "name": "sports" },
            { "name": "photography" },
            { "name": "hiking" }
        ] );
    }

    function down( schema, query ) {
        schema.drop( "tags" );
    }

}
