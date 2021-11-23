$(function() {
    var clase = null;
    $(".container").hide()
    window.addEventListener("message", function(event) {
        const val = event['data']
        if (val['show']) {
            console.log(val['type']);
            if (val['type'] == 'info') {
                clase = "info";
            } else if (val['type'] == 'normal') {
                $(".container").addClass("normal");
                clase = "normal";
            } else if (val['type'] == 'error') {
                clase = "error";
            } else if (val['type'] == 'correct') {
                clase = "correct";
            }

            if (!(val['bar'])) {
                $(".progress").fadeOut(50);
            } else {
                $(".progress").fadeIn(500);
            }

            var percentage = `${val['bar_value']}%`;
            $(".container").removeClass(clase);
            $(".container").addClass(clase);
            document.getElementById('pbar').style.width = percentage;
            $(".container")['fadeIn'](500)
            $(".text")['html'](val['text'])
            $(".title")['html'](val['title'])
        } else {
            $(".container").removeClass(clase);
            $(".container")['fadeOut'](500)
        }

    })
})