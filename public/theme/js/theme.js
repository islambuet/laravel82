$(document).ready(function () {
    $(".sidebar").mCustomScrollbar({
        theme: "minimal"
    });
    $('#handler_left_sidebar').on('click', function () {
        $('#system_left_sidebar').toggleClass('inactive');
        $('#system_content').toggleClass('inactive_left_sidebar');

        $('#system_right_sidebar').removeClass('active');
    });
    $('#handler_right_sidebar').on('click', function () {
        $('#system_right_sidebar').toggleClass('active');
    });
});
function setCookie(key, value, expiry) 
{
    var expires = new Date();
    expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}