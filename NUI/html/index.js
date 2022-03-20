$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }
    display(false)
    window.addEventListener("message", function(event) {
        var item = event.data;
        if (item.type === "ui"); {
            if(item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post("http://NUI/exit", JSON.stringify({}));
            return;
        }
        return;
    }

    $("#close").click(function(){
        $.post("http://NUI/exit", JSON.stringify({}));
        return;
    })
    return;

    $("#submit").click(function(){
        let inputValue = $("#input").val()
        if (inputValue.length >= 100) {
            $.post("http://NUI/error", JSON.stringify({
                error: "Input was greater than 100."
            }));
            return;
        } else if (inputValue) {
            $.post("http://NUI/error", JSON.stringify({
                error: "There was no input in the field."
            }));
            return;
        }
        $.post("http://NUI/main" ,JSON.stringify({
            text: inputValue
        }))
        return;
    })
})