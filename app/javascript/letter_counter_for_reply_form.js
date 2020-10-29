$(function(){

    var text_max = 140; // 最大入力値
    $(".reply_count").text(text_max - $("#reply_post_content").val().length);

    $("#reply_post_content").on("keydown keyup keypress change",function(){
        var text_length = $(this).val().length;
        var countdown = text_max - text_length;
        $(".reply_count").text(countdown);
        // CSSは任意で
        if(countdown < 0){
            $('.reply_count').css({
                color:'#ff0000',
                fontWeight:'bold'
            });
        } else {
            $('.reply_count').css({
                color:'#000000',
                fontWeight:'normal'
            });
        }
    });
});
