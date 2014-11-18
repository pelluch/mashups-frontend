// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


ready = function() {

	var reload_nav_btns = function(){
		alert("OUCH!");
		var sources = new Array();
		$.each($("input[name='[source_ids][]']:checked"), function() {
		  sources.push($(this).val());
		});

		$.ajax({
  			type: "PATCH",
  			url: "/mashups/"+$("#mashup_id").val(),
  			data: {
  				ids: $(this).data('ids'),
  				source: sources,
  				mashup: { name: "un_nombre" }
  			}
		}).done(function(){
			$(".nav-btn").click(reload_nav_btns);
		});
	};

	$(".nav-btn").click(reload_nav_btns);

	$("#search_btn").click(function()
	{

		var sources = new Array();
		$.each($("input[name='[source_ids][]']:checked"), function() 
		{
		  sources.push($(this).val());
		});

		if (sources.length === 0) 
		{
			alert('Pick at least one source');
		}
		else 
		{
			$('#loader').css('display','block');
			$.ajax({
	  			type: "PATCH",
	  			url: "/mashups/"+$("#mashup_id").val(),
	  			data: 
	  			{
	  				ids: $('#parameters').data('count'),
	  				new_param: $("#query_text").val(),
	  				source: sources,
	  				mashup: { name: "un_nombre" }
	  			}
	  		}).done(function()
	  		{
				$(".nav-btn").click(reload_nav_btns);
				$('#loader').css('display','none');
			});
		}
		
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);

