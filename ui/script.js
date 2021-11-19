$(function() {
    var clase = "normal";
    $(".container").hide()
    window.addEventListener("message", function(v) {
        const val = event['data']
        if (val['show']) {
            console.log(val['type']);
            if (val['type'] == 'info') {
                $(".container").addClass("info");
                clase = "info";
            } else if (val['type'] == 'normal') {
                $(".container").addClass("normal");
                clase = "normal";
            } else if (val['type'] == 'error') {
                $(".container").addClass("error");
                clase = "error";
            } else if (val['type'] == 'correct') {
                $(".container").addClass("correct");
                clase = "correct";
            }

            if (!(val['bar'])) {
                $(".progress").fadeOut(50);
            } else {
                $(".progress").fadeIn(500);
            }

            var percentage = `${val['bar_value']}%`;

            console.log(percentage)
            document.getElementById('pbar').style.width = percentage;
            $(".container")['fadeIn'](500)
            $(".text")['html'](val['text'])
            $(".title")['html'](val['title'])
        } else if (val['show'] == false) {
            $(".container").removeClass(clase);
            displayed = false
            $(".container")['fadeOut'](500)
        } else if (val['show'] == 'close') {
            $(".container").removeClass(clase);
            displayed = false
            $(".container").hide();
        } else if (val['show'] == 'open') {
            $(".container").addClass(clase);
            displayed = true
            $(".container").show();
        }

    })
})