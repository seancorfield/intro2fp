<cfscript>
	include "fp/library.cfm";
	
	v = [ 1, 2, 3, 4, 5 ];
	
	// Clojure has this in the core library:
	function inc( n ) { return n + 1; }
	
	v1 = map( inc, v );
	writeDump( var = v1, label = "map( inc, v )" );
	
	v2 = map( comp( inc, inc ), v );
	writeDump( var = v2, label = "map( comp( inc, inc ), v )" );
	
	// Clojure has + in the core library that adds any number of arguments:
	function add( a, b ) { return a + b; }
	
	n = reduce( add, v );
	writeOutput( "reduce( add, v ) = " & n & chr(60) & "br />" );
	
	// Clojure has this as even? in the core library:
	function even( n ) { return n % 2 == 0; }
	
	ve = filter( even, v );
	writeDump( var = ve, label = "filter( even, v )" );
	
	vo = filter( complement( even ), v );
	writeDump( var = vo, label = "filter( complement( even ), v )" );
	
	v3 = map( partial( add, 10 ), v );
	writeDump( var = v3, label = "map( partial( add, 10 ), v )" );
	
	v4 = partial( map, inc ).call( v );
	writeDump( var = v4, label = "partial( map, inc ).call( v )" );
	
</cfscript>