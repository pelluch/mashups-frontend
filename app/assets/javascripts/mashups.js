// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


ready = function() {

	var find_sources = function() {

		var sources = new Array();
		$.each($("input[name='[source_ids][]']:checked"), function() 
		{
		  sources.push($(this).val());
		});
		return sources;
	};

	var ajax_call = function(ids, new_param) {
		var sources = find_sources(); 
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
	  			data: {
	  				ids: ids,
	  				new_param: new_param,
	  				source: sources,
	  				mashup: { name: $('#parameters').data('name') }
	  			}
			}).done(function(){
				$('.keyword-link').click(reload_keywords);
				$(".nav-btn").click(reload_nav_btns);
				$('#loader').css('display','none');
			});
		}
	};

	var reload_nav_btns = function(){
		ajax_call($(this).data('ids'), "");
	};

	$(".nav-btn").click(reload_nav_btns);

	var reload_keywords = function() {
		ajax_call('', $(this).data('value'))
	};

	$(".keyword-link").click(reload_keywords);


	$("#search_btn").click(function()
	{
		ajax_call('', $("#query_text").val());
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);

