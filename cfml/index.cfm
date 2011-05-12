<cfscript>
	include "fp/library.cfm";
	
	v = [ 1, 2, 3, 4, 5 ];
	m = { a = 1, b = 2, c = 3 };
	
	// Clojure has this in the core library:
	function inc( n ) { return n + 1; }
	
	v1 = map( inc, v );
	writeDump( var = v1, label = "map( inc, v )" );
	
	m1 = map( inc, m );
	writeDump( var = m1, label = "map( inc, m )" );
	
	// Clojure has + in the core library that adds any number of arguments:
	function add( a, b ) { return a + b; }
	
	n = reduce( add, v );
	writeOutput( "reduce( add, v ) = " & n & chr(60) & "br />" );
	
	n = reduce( add, m );
	writeOutput( "reduce( add, m ) = " & n & chr(60) & "br />" );
	
	// Clojure has this as even? in the core library:
	function even( n ) { return n % 2 == 0; }
	
	ve = filter( even, v );
	writeDump( var = ve, label = "filter( even, v )" );
	
	me = filter( even, m );
	writeDump( var = me, label = "filter( even, m )" );
	
	v2 = map( comp( inc, inc ), v );
	writeDump( var = v2, label = "map( comp( inc, inc ), v )" );
	
	mo = filter( complement( even ), m );
	writeDump( var = mo, label = "filter( complement( even ), m )" );
	
	v3 = map( partial( add, 10 ), v );
	writeDump( var = v3, label = "map( partial( add, 10 ), v )" );
	
	m4 = partial( map, inc ).call( m );
	writeDump( var = m4, label = "partial( map, inc ).call( m )" );
	
</cfscript>