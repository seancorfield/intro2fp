component {
	
	include "primitive.cfm";
	
	function init( f ) {
		if ( !isCustomFunction( f ) && !( isObject( f ) && structKeyExists( f, "call" ) && isCustomFunction( f.call ) ) ) throw "Argument is not a function";
		variables.f = f;
		return this;
	}
	
	function call() {
		if ( isCustomFunction( variables.f ) ) return variables.f( argumentCollection = arguments );
		else variables.f.call( argumentCollection = arguments );
	}
	
}