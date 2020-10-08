$(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        let cops = data.cops
        let emc = data.sani
        let mech = data.meca
        let taxi = data.taxi
        let paused = data.paused
        if (cops == "red") {
            document.getElementById('cops').style.textShadow = "2px 0 0 #FF0000, 0 -2px 0 #FF0000, 0 2px 0 #FF0000, -2px 0 0 #FF0000";
        } else if (cops == "yellow") {
            document.getElementById('cops').style.textShadow = "2px 0 0 #FFFF00, 0 -2px 0 #FFFF00, 0 2px 0 #FFFF00, -2px 0 0 #FFFF00";
        } else if (cops == "green") {
            document.getElementById('cops').style.textShadow = "2px 0 0 #008000, 0 -2px 0 #008000, 0 2px 0 #008000, -2px 0 0 #008000";
        }
        if (emc == "red") {
            document.getElementById('ambulance').style.textShadow = "2px 0 0 #FF0000, 0 -2px 0 #FF0000, 0 2px 0 #FF0000, -2px 0 0 #FF0000";
        } else if (emc == "yellow") {
            document.getElementById('ambulance').style.textShadow = "2px 0 0 #FFFF00, 0 -2px 0 #FFFF00, 0 2px 0 #FFFF00, -2px 0 0 #FFFF00";
        } else if (emc == "green") {
            document.getElementById('ambulance').style.textShadow = "2px 0 0 #008000, 0 -2px 0 #008000, 0 2px 0 #008000, -2px 0 0 #008000";
        }
        if (mech == "red") {
            document.getElementById('mechanic').style.textShadow = "2px 0 0 #FF0000, 0 -2px 0 #FF0000, 0 2px 0 #FF0000, -2px 0 0 #FF0000";
        } else if (mech == "yellow") {
            document.getElementById('mechanic').style.textShadow = "2px 0 0 #FFFF00, 0 -2px 0 #FFFF00, 0 2px 0 #FFFF00, -2px 0 0 #FFFF00";
        } else if (mech == "green") {
            document.getElementById('mechanic').style.textShadow = "2px 0 0 #008000, 0 -2px 0 #008000, 0 2px 0 #008000, -2px 0 0 #008000";
        }
        if (taxi == "red") {
            document.getElementById('taxi').style.textShadow = "2px 0 0 #FF0000, 0 -2px 0 #FF0000, 0 2px 0 #FF0000, -2px 0 0 #FF0000";
        } else if (taxi == "yellow") {
            document.getElementById('taxi').style.textShadow = "2px 0 0 #FFFF00, 0 -2px 0 #FFFF00, 0 2px 0 #FFFF00, -2px 0 0 #FFFF00";
        } else if (taxi == "green") {
            document.getElementById('taxi').style.textShadow = "2px 0 0 #008000, 0 -2px 0 #008000, 0 2px 0 #008000, -2px 0 0 #008000";
        }

        if (data.action == 'disableHud') {
            console.log(' event.data.paused', event.data.data);
            paused ? $('body').fadeOut(300) : $('body').fadeIn(1000)
        }
    })
})
