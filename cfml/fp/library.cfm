<cfscript>
	
	// CAUTION: HERE BE DRAGONS!
	
	function map( f, coll ) {
		if ( !isCustomFunction( f ) && !( isObject( f ) && structKeyExists( f, "call" ) && isCustomFunction( f.call ) ) ) throw "1st argument is not a function";
		if ( isArray( coll ) ) return map_array( f, coll );
		if ( isObject( coll ) && structKeyExists( coll, "map" ) && isCustomFunction( coll.map ) ) return coll.map( f );
		throw "2nd argument does not support map";
	}
	
	function reduce() {
		var f = arguments[1];
		var coll = arguments[2];
		if ( arrayLen( arguments ) == 2 ) {
			// reduce( f, coll )
			if ( !isCustomFunction( f ) && !( isObject( f ) && structKeyExists( f, "call" ) && isCustomFunction( f.call ) ) ) throw "1st argument is not a function";
			if ( isArray( coll ) ) return reduce0_array( f, coll );
			if ( isObject( coll ) && structKeyExists( coll, "reduce0" ) && isCustomFunction( coll.reduce0 ) ) return coll.reduce0( f );
		} else {
			// reduce( init, f, coll )
			var init = arguments[1];
			f = arguments[2];
			coll = arguments[3];
			if ( !isCustomFunction( f ) && !( isObject( f ) && structKeyExists( f, "call" ) && isCustomFunction( f.call ) ) ) throw "1st argument is not a function";
			if ( isArray( coll ) ) return reduce1_array( init, f, coll );
			if ( isObject( coll ) && structKeyExists( coll, "reduce1" ) && isCustomFunction( coll.reduce1 ) ) return coll.reduce1( init, f );
		}
		throw "2nd argument does not support reduce";
	}
	
	function filter( pred, coll ) {
		if ( !isCustomFunction( pred ) && !( isObject( pred ) && structKeyExists( pred, "call" ) && isCustomFunction( pred.call ) ) ) throw "1st argument is not a function";
		if ( isArray( coll ) ) return filter_array( pred, coll );
		if ( isObject( coll ) && structKeyExists( coll, "filter" ) && isCustomFunction( coll.filter ) ) return coll.filter( pred );
		throw "2nd argument does not support filter";
	}
	
	function comp() {
		return new fp.Compose( argumentCollection = arguments );
	}
	
	function complement( f ) {
		return new fp.Compose( _not, f );
	}
	
	// DO NOT USE THESE DIRECTLY:
	
	function map_array( f, coll ) {
		var result = [ ];
		for ( var x in coll ) {
			if ( isCustomFunction( f ) ) {
				arrayAppend( result, f( x ) );
			} else {
				arrayAppend( result, f.call( x ) );
			}
		}
		return result;
	}
	
	function reduce0_array( f, coll ) {
		var n = arrayLen( coll );
		if ( n ) {
			var result = coll[1];
			for ( var i = 2; i <= n; ++i ) {
				if ( isCustomFunction( f ) ) {
					result = f( result, coll[i] );
				} else {
					result = f.call( result, coll[i] );
				}
			}
			return result;
		}
		throw "Cannot reduce empty array";
	}
	
	function reduce1_array( init, f, coll ) {
		var result = init;
		for ( var x in coll ) {
			if ( isCustomFunction( f ) ) {
				result = f( result, x );
			} else {
				result = f.call( result, x );
			}
		}
		return result;
	}
	
	function filter_array( pred, coll ) {
		var result = [ ];
		for ( var x in coll ) {
			if ( isCustomFunction( pred ) ) {
				if ( pred( x ) ) arrayAppend( result, x );
			} else {
				if ( pred.call( x ) ) arrayAppend( result, x );
			}
		}
		return result;
	}
	
	function _not( x ) { return !x; }
	
</cfscript>