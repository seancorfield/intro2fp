<cfscript>
	
	include "primitive.cfm";
	
	// CAUTION: HERE BE DRAGONS!
	
	function map( f, coll ) {
		if ( !isCustomFunction( f ) && !( isObject( f ) && structKeyExists( f, "call" ) && isCustomFunction( f.call ) ) ) throw "1st argument is not a function";
		if ( isArray( coll ) || isStruct( coll ) ) return map_primitive( f, coll );
		if ( isObject( coll ) && structKeyExists( coll, "map" ) && isCustomFunction( coll.map ) ) return coll.map( f );
		throw "2nd argument does not support map";
	}
	
	function reduce() {
		var f = arguments[1];
		var coll = arguments[2];
		if ( arrayLen( arguments ) == 2 ) {
			// reduce( f, coll )
			if ( !isCustomFunction( f ) && !( isObject( f ) && structKeyExists( f, "call" ) && isCustomFunction( f.call ) ) ) throw "1st argument is not a function";
			if ( isArray( coll ) || isStruct( coll ) ) return reduce0_primitive( f, coll );
			if ( isObject( coll ) && structKeyExists( coll, "reduce0" ) && isCustomFunction( coll.reduce0 ) ) return coll.reduce0( f );
		} else {
			// reduce( init, f, coll )
			var init = arguments[1];
			f = arguments[2];
			coll = arguments[3];
			if ( !isCustomFunction( f ) && !( isObject( f ) && structKeyExists( f, "call" ) && isCustomFunction( f.call ) ) ) throw "1st argument is not a function";
			if ( isArray( coll ) || isStruct( coll ) ) return reduce1_primitive( init, f, coll );
			if ( isObject( coll ) && structKeyExists( coll, "reduce1" ) && isCustomFunction( coll.reduce1 ) ) return coll.reduce1( init, f );
		}
		throw "last argument does not support reduce";
	}
	
	function filter( pred, coll ) {
		if ( !isCustomFunction( pred ) && !( isObject( pred ) && structKeyExists( pred, "call" ) && isCustomFunction( pred.call ) ) ) throw "1st argument is not a function";
		if ( isArray( coll ) || isStruct( coll ) ) return filter_primitive( pred, coll );
		if ( isObject( coll ) && structKeyExists( coll, "filter" ) && isCustomFunction( coll.filter ) ) return coll.filter( pred );
		throw "2nd argument does not support filter";
	}
	
	function comp() {
		return new fp.Compose( argumentCollection = arguments );
	}
	
	function complement( f ) {
		return new fp.Compose( _not, f );
	}
	
	function partial() {
		return new fp.Partial( argumentCollection = arguments );
	}
	
</cfscript>