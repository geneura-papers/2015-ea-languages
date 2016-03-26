// update data

var colors = { " BitString": 'red',
	       " BitVector": 'blue',
	       " BitSet": 'orange' };

// data should be at most 1
function scale( data, pixels ) {
    return data[" normtime"]*pixels + "px"; 
};
    

var animation_div = d3.select("#animation");
var this_width = animation_div[0][0].offsetWidth;
d3.csv("mo-256bits.csv",
       function(error,data){
	   var sorted_data = data.sort( function( a,b) {
	       return a[" normtime"] - b[" normtime"];
	   });
	   var the_bars = new Array;
	   var bars = animation_div.selectAll("div").data(data);

	   bars.enter().append("div")
	       .style("width", function( data ) {
		   return scale(data,this_width);
	       })
	       .style("background-color",  function( data ) {
		   return colors[data[' datastructure']];
	       })
	       .text(function(d) { return d.languagerepresentation; });
       });
