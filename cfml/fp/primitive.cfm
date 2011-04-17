<cfscript>
	
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