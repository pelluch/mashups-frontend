// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


ready = function() {

	$("#search_btn").click(function(){
		$.ajax({
  			type: "PATCH",
  			url: "#",
  			data: {
  				mashup: { id: $("#mashup_id").val(),
  				param_new: $("#query_text").val() }
  			}
  			//$("#mashup_list").append('<a class="btn btn-default" data-method="put" href="/mashups/1?mashup%5Bparameters%5D%5B%5D=RESET_MODE" rel="nofollow" type="button">' + $("#query_text").val() + '</a>');
  		}).done(function(data) {
			$('#cloud_tag_container').append(data);
			if($("#menu_list").children().length > 0)
			{

			}
			else if ( $("#mashup_list").children().length == 4) {

			}
			else {
				$("#mashup_list").append('<a class="btn btn-default" type="button" rel="nofollow" href="/mashups/3?mashup%5Bids%5D=' + $('#mashup_count').val() + '" data-method="put">' + $("#query_text").val() + '</a>');
				$("#mashup_count").val(parseInt($("#mashup_count").val())+1);
				$("#mashup_parameters_list").val($("#mashup_parameters_list").val()+","+$("#query_text").val());
				$("#query_text").val("");
			}
  		});
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);

