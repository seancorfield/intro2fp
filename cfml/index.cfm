<cfscript>
	include "fp/library.cfm";
	
	v = [ 1, 2, 3, 4, 5 ];
	
	function inc( n ) { return n + 1; }
	
	v1 = map( inc, v );
	writeDump( var = v1, label = "map( inc, v )" );
	
	v2 = map( comp( inc, inc ), v );
	writeDump( var = v2, label = "map( comp( inc, inc ), v )" );
	
	function add( a, b ) { return a + b; }
	
	n = reduce( add, v );
	writeOutput( "reduce( add, v ) = " & n & "<br />" );
	
	function even( n ) { return n % 2 == 0; }
	
	ve = filter( even, v );
	writeDump( var = ve, label = "filter( even, v )" );
	
	vo = filter( complement( even ), v );
	writeDump( var = vo, label = "filter( complement( even ), v )" );
	
</cfscript>