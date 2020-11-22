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
    $(document).on("change", ":file", function(event)
    {
        if(($(this).is('[class*="file_external"]')))
        {
            return;
        }
        var container=$(this).attr('data-preview-container');
        if(container)
        {
            console.log("container found");
            if(this.files && this.files[0])
            {
                var file_type=this.files[0].type;
                if(file_type && file_type.substr(0,5)=="image")
                {
                    var preview_height=200;
                    if($(this).attr('data-preview-height'))
                    {
                        preview_height=$(this).attr('data-preview-height');
                    }
                    var reader = new FileReader();

                    reader.onload = function (e)
                    {
                        var img_tag='<img height="'+preview_height+'" src="'+ e.target.result+'" >';                        
                        $(container).html(img_tag);
                    };
                    reader.readAsDataURL(this.files[0]);
                }
                else
                {
                    
                    $(container).html(this.files[0].name);
                }
            }
        }
        else
        {
            console.log('no container');
        }

    });
});
function setCookie(key, value, expiry) 
{
    var expires = new Date();
    expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}