﻿
var rgbStart = [139,195,74]
var rgbEnd = [183,28,28]

var rgbStart2 = [183,28,28]
var rgbEnd2 = [139,195,74]

var rgbStart3 = [0,191,255]
var rgbEnd3 = [0,191,255]

var rgbStart4 = [220,220,220]
var rgbEnd4 = [171,204,255]

var rgbStart5 = [0,0,0]
var rgbEnd5 = [183,28,28]

$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.action == "setValue"){
			if (event.data.key == "job"){
				setJobIcon(event.data.icon)
			}
			setValue(event.data.key, event.data.value)

		}else if (event.data.action == "updateStatus"){
			updateStatus(event.data.status);
		}else if (event.data.action == "toggle"){
			if (event.data.show){
				console.log("boz");
				$('.ui').show();
			} else{
				console.log("boz");
				$('.ui').hide();
			}
		}else if (event.data.action == "toggleHealthLoss"){
			if (event.data.show){
				$('#health').css('box-shadow', '0 0 10px 0 rgba(255,0,0,1)');
			} else{
				$('#health').css('box-shadow', '0 0 0 0');
			}
		}else if (event.data.action == "updateHealth"){
			updateHealth(event.data.health)
		}else if (event.data.action == "updateBreath"){
			updateBreath(event.data.breath)
		}else if (event.data.action == "updateArmor"){
			updateArmor(event.data.armor)
		}
	});

});

function updateHealth(health){
	
	var bgcolor = colourGradient(health/100, rgbEnd5, rgbStart5)
	$('#health .bg').css('height', health + '%')
	$('#health .bg').css('background-color', 'rgb(' + bgcolor[0] +','+ bgcolor[1] +','+ bgcolor[2] +')')
}
function updateArmor(armor){
	var bgcolor = colourGradient(armor/100, rgbEnd4, rgbStart4)
	$('#armor .bg').css('height', armor + '%')
	$('#armor .bg').css('background-color', 'rgb(' + bgcolor[0] +','+ bgcolor[1] +','+ bgcolor[2] +')')
}
function updateBreath(breath){
	var bgcolor = colourGradient(breath/10, rgbEnd3, rgbStart3)
	$('#breath .bg').css('height', breath*10 + '%')
	$('#breath .bg').css('background-color', 'rgb(' + bgcolor[0] +','+ bgcolor[1] +','+ bgcolor[2] +')')
}

function setValue(key, value){
	$('#'+key+' span').html(value)

}

function setJobIcon(value){
	$('#job .icon img').attr('src', 'img/jobs/'+value+'.png')
}

function updateStatus(status){
	var hunger = status[0]
	var thirst = status[1]
	if(hunger.percent < 10){
		$('#hungera').show();
	}else{
		$('#hungera').hide();
	}
	if(thirst.percent < 10){
		$('#thirst').show();
	}else{
		$('#thirst').hide();
	}
	$('#hunger .bg').css('height', hunger.percent+'%')
	$('#water .bg').css('height', thirst.percent+'%')

}

//API Shit
function colourGradient(p, rgb_beginning, rgb_end){
    var w = p * 2 - 1;

    var w1 = (w + 1) / 2.0;
    var w2 = 1 - w1;

    var rgb = [parseInt(rgb_beginning[0] * w1 + rgb_end[0] * w2),
        parseInt(rgb_beginning[1] * w1 + rgb_end[1] * w2),
            parseInt(rgb_beginning[2] * w1 + rgb_end[2] * w2)];
    return rgb;
};