var boz = 1;

$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.action == "updateData"){
			setData(event.data.data)
		}else if (event.data.action == "toggle"){
			if (event.data.show){
				$('.panel').show();
			} else{
				$('.panel').hide();
			}
		}
	});

});

function setData(data){
	$('#needs p').html(data)
}
