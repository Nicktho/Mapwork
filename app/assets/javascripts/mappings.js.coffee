# Turbolinks still works with this 
$(document).on 'click', '.map-row', ->
	window.document.location = $(this).attr("href")
