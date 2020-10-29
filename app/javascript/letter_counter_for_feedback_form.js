$(function(){

    var text_max = 280; // 最大入力値
    $(".feedback_count").text(text_max - $("#feedback_post_content").val().length);

    $("#feedback_post_content").on("keydown keyup keypress change",function(){
        var text_length = $(this).val().length;
        var countdown = text_max - text_length;
        $(".feedback_count").text(countdown);
        // CSSは任意で
        if(countdown < 0){
            $('.feedback_count').css({
                color:'#ff0000',
                fontWeight:'bold'
            });
        } else {
            $('.feedback_count').css({
                color:'#000000',
                fontWeight:'normal'
            });
        }
    });
});
