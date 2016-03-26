// update data
function update(the_div, data) {
    
    // DATA JOIN
    // Join new data with old elements, if any.
    var bars = the_div.selectAll("div").data(data);
    
    // ENTER
    // Create new elements as needed.
    bars.enter().append("div")
	.style("width", function(d) { 
	    //			     console.log("ENTER"+d);
	    return d/100 + "px"; 
	})
	.text(function(d) { return d; });
    
    // ENTER + UPDATE
    // Appending to the enter selection expands the update selection to include
    // entering elements; so, operations on the update selection after appending to
    // the enter selection will apply to both entering and updating nodes.
    bars.style("width", function(d) { 
	//		     console.log("ENTER+UPDATE"+d);
	return d/100 + "px"; 
    }).text(function(d) { return d; });
    
    // EXIT
    // Remove old elements as needed.
    bars.exit().remove();
}

var animation_div = d3.select("#animation");
d3.csv("mo-256bits.csv",
       function(error,data){
	   console.log(data);
	   var the_bars = new Array;
	   for (var i in data ) {
	       the_bars.push( parseFloat(data[i][" normtime"])*100000 );
	       console.log(the_bars);
	       update(animation_div, the_bars );
	   }
       }
      );
