// update data

var colors = { " BitString": "lightblue",
	       " BitVector": "yellow",
	       " BitSet": "orange" };

// data should be at most 1
function scale( data, pixels ) {
    return data[" normtime"]*pixels + "px"; 
}
    
// loads data
function make_bars( div_id, file_name, cb ) {
    var animation_div = d3.select("#"+div_id);
    var this_width = animation_div[0][0].offsetWidth;
    d3.csv(file_name,
	   function(error,data){
	       var sorted_data = data.sort( function( a,b) {
		   return a[" normtime"] - b[" normtime"];
	       });
	       var the_bars = new Array;
	       var bars = animation_div.selectAll("div").data(data);
	       
	       bars.enter().append("div")
		   .style("background-color",  function( data ) {
		       return colors[data[" datastructure"]];
		   })
		   .text(function(d) { return d.languagerepresentation; });
	       cb(div_id, bars);
	   });
}

// animates
function animate( div_id, bars ) {
    var animation_div = d3.select("#"+div_id);
    var this_width = animation_div[0][0].offsetWidth;
    bars.transition()
	.delay(function( d ) {
	    return 7000*d[" normtime"]; // scale to 10 seconds
	})
	.style("width", function( data ) {
	    return scale(data,this_width);
	});
}

