// update data
function update(the_div, data) {

    var this_width = the_div[0][0].offsetWidth;
    
    // DATA JOIN
    // Join new data with old elements, if any.
    var bars = the_div.selectAll("div").data(data);
    
    // ENTER
    // Create new elements as needed.
    bars.enter().append("div")
	.style("width", function( data ) {
	    return scale(data,this_width);
	})
	.text(function(d) { return d[" text"]; });
    
    // ENTER + UPDATE
    // Appending to the enter selection expands the update selection to include
    // entering elements; so, operations on the update selection after appending to
    // the enter selection will apply to both entering and updating nodes.
    bars.style("width", function( data ) {
	    return scale(data,this_width);
    })
	.text(function(d) { return d["languagerepresentation"]; });
    
    // EXIT
    // Remove old elements as needed.
    bars.exit().remove();
}

// data should be at most 1
function scale( data, pixels ) {
    console.log( data );
    return data[" normtime"]*pixels + "px"; 
};
    

var animation_div = d3.select("#animation");
d3.csv("mo-256bits.csv",
       function(error,data){
	   var sorted_data = data.sort( function( a,b) {
	       return a [" normtime"] - b[" normtime"];
	   });
	   console.log(sorted_data);
	   var the_bars = new Array;
	   for (var i in sorted_data ) {
	       the_bars.push( sorted_data[i] );
	       console.log(the_bars);
	       update(animation_div, the_bars );
	   }
       }
      );
