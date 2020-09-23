<<<<<<< HEAD
// 画面が読み込まれた時、is-slideを外し、アニメーションさせる
$(window).on('load', function(){
 $('body').removeClass('is-slide');
=======
// ローディング画面をフェードインさせてページ遷移
$(function(){
    // リンクをクリックしたときの処理。外部リンクやページ内移動のスクロールリンクなどではフェードアウトさせたくないので少し条件を加えてる。
    $('a[href ^= "http://3.113.152.109"]' + 'a[target != "_blank"]').click(function(){
        var url = $(this).attr('href'); // クリックされたリンクのURLを取得
        $('#js-loader').fadeIn(600);    // ローディング画面をフェードイン
        setTimeout(function(){ location.href = url; }, 800); // URLにリンクする
        return false;
    });
>>>>>>> 429cc1d12f9050e6e8504e73cb7a740263abe31e
});

$(function() {
 // ハッシュリンク(#)と別ウィンドウでページを開く場合は実行しない

 $('a:not([href^="#"]):not([target])').on('click', function(e){
   e.preventDefault();         // ページ遷移を一旦キャンセル
   url = $(this).attr('href'); // 遷移先のURLを取得

   if (url !== '') {
     $('body').addClass('is-slide-in'); // 画面遷移前のアニメーション is-slide-in

     setTimeout(function () {
       window.location = url;  // 0.7秒後に取得したURLに遷移
     }, 700);
   }
   return false;
 });

});
