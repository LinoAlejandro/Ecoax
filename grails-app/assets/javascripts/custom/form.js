$(document).ready(function() {
    var $window = $(window);
    var $pane = $('#pane1');
    var decoration = document.getElementById('decoration');

    function checkWidth() {
        var windowsize = $window.width();
        if (windowsize < 750) {
            decoration.style.display = "none";
        } else {
            decoration.style.display = "block";
        }
    }

    checkWidth();

    $(window).resize(checkWidth);
});
