<cfscript>
	
	// DO NOT USE THESE DIRECTLY:
	
	function map_primitive( f, coll ) {
		var a = isArray( coll );
		var result = a ? [ ] : { };
		var i = 0;
		for ( var x in coll ) {
			++i;
			var k = a ? i : x;
			var v = a ? x : coll[ x ];
			if ( isCustomFunction( f ) ) {
				result[ k ] = f( v );
			} else {
				result[ k ] = f.call( v );
			}
		}
		return result;
	}
	
	function reduce0_primitive( f, coll ) {
		var a = isArray( coll );
		var n = a ? arrayLen( coll ) : structCount( coll );
		if ( n ) {
			var result = 0;
			var i = 0;
			for ( var x in coll ) {
				++i;
				var v = a ? x : coll[ x ];
				if ( i == 1 ) {
					result = v;
				} else if ( isCustomFunction( f ) ) {
					result = f( result, v );
				} else {
					result = f.call( result, v );
				}
			}
			return result;
		}
		throw "Cannot reduce empty collection";
	}
	
	function reduce1_primitive( init, f, coll ) {
		var a = isArray( coll );
		var result = init;
		for ( var x in coll ) {
			var v = a ? x : coll[ x ];
			if ( isCustomFunction( f ) ) {
				result = f( result, v );
			} else {
				result = f.call( result, v );
			}
		}
		return result;
	}
	
	function filter_primitive( pred, coll ) {
		var a = isArray( coll );
		var result = a ? [ ] : { };
		var i = 0;
		for ( var x in coll ) {
			var v = a ? x : coll[ x ];
			if ( isCustomFunction( pred ) ) {
				if ( pred( v ) ) {
					++i;
					var k = a ? i : x;
					result[ k ] = v;
				}
			} else {
				if ( pred.call( v ) ) {
					++i;
					var k = a ? i : x;
					result[ k ] = v;
				}
			}
		}
		return result;
	}
	
	function _not( x ) { return !x; }
	
</cfscript>