$(document).ready(function() {
    var $window = $(window);
    var $pane = $('#pane1');
    var hr = document.getElementById('hr-custom');

    function checkWidth() {
        var windowsize = $window.width();
        if (windowsize < 750) {
            hr.style.display = "none";
        } else {
            hr.style.display = "block";
        }
    }

    checkWidth();

    $(window).resize(checkWidth);
});
