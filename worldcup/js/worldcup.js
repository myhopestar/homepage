//words
$(document).ready(function(){
  $("#word").click(function(){
    $("#showwords").slideToggle("slow");
  });
});
//nav
$(document).ready(function() {
						   
	var hash = window.location.hash.substr(1);
	var href = $('#nav li a').each(function(){
		var href = $(this).attr('href');
		if(hash==href.substr(0,href.length-4)){
			var toLoad = hash+'.asp #body';
			$('#body').load(toLoad)
		}											
	});

	$('#nav li a').click(function(){
								  
		var toLoad = $(this).attr('href')+' #body';
		$('#body').hide('fast',loadbody);
		$('#load').remove();
		$('#container').append('<span id="load">LOADING...</span>');
		$('#load').fadeIn('normal');
		window.location.hash = $(this).attr('href').substr(0,$(this).attr('href').length-4);
		function loadbody() {
			$('#body').load(toLoad,'',showNewbody())
		}
		function showNewbody() {
			$('#body').show('normal',hideLoader());
		}
		function hideLoader() {
			$('#body').fadeOut('normal');
		}
		return false;
		
	});

});