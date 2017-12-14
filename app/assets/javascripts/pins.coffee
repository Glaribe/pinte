$ ->
	$('#pins').imagesLoaded ->
		$('#pins').masonry
			itemSelector: '.pin'
			isFitWidth: true