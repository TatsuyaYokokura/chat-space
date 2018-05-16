$(function() {
  function buildHTML(message) {
    if (message.image_url === null) {
      var image = "";
    } else {
      var image = message.image_url;
    }
    var html =
      `<li class="chat-box">
        <div class="chat-box__user">
          <p class="chat-box__user--name">${message.user_name}</p>
          <span class="chat-box__user--time">${message.create_at}</span>
        </div>
        <p class="chat-box__message">${message.message}</p>
        <image src="${image}">
      </li>`
      return html;
    }
  $('#message-form').on('submit', function(e) {
    e.preventDefault();   //同期通信するフォームをストップしている
    var formData = new FormData(this);
    var url = $(this).attr('action');
    console.log('test');
    $.ajax({
      url: url,   //どこのアクションに情報を飛ばしたいかを指定していあげる。この3つは基本的にいれる必要がある
      type: "POST",
      data: formData,   //送りたいデータの内容
      dataType: 'json',   //この3つは基本的にいれる必要がある（もしくはjson形式をリクエストする方法もある）
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.main__body__chat-wrap').append(html);
      $('.main__body').animate({scrollTop: $('.main__body__chat-wrap').height()});
      $('.message-box').val("");
      $('.submit-btn').prop('disabled', false);
    })
    .fail(function() {
      alert('error');
    })
  });
});
