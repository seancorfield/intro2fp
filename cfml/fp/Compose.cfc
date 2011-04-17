component {
	
	include "primitive.cfm";
	
	function init() {
		variables.fns = [ ];
		var n = arrayLen( arguments );
		for ( var i = 1; i <= n; ++i ) {
			arrayAppend( variables.fns, new fp.Fn( arguments[ i ] ) );
		}
		return this;
	}
	
	function call( arg ) {
		var n = arrayLen( variables.fns );
		for ( var i = n; i > 0; --i ) {
			arg = variables.fns[ i ].call( arg );
		}
		return arg;
	}
	
}