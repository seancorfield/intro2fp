component {
	
	include "primitive.cfm";
	
	function init() {
		variables.fn = new fp.Fn( arguments[1] );
		variables.args = [ ];
		var n = arrayLen( arguments );
		for ( var i = 2; i <= n; ++i ) {
			arrayAppend( variables.args, arguments[ i ] );
		}
		return this;
	}
	
	function call() {
		var allArgs = [ ];
		var n = arrayLen( variables.args );
		for ( var i = 1; i <= n; ++i ) {
			arrayAppend( allArgs, variables.args[ i ] );
		}
		n = arrayLen( arguments );
		for ( var i = 1; i <= n; ++i ) {
			arrayAppend( allArgs, arguments[ i ] );
		}
		return variables.fn.call( argumentCollection = allArgs );
	}
	
}