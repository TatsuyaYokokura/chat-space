$(document).on('turbolinks:load', function() {
  $(function() {
    function buildHTML(message) {
      var image = message.image_url ? image = message.image_url : image = "";
      var html =
        `<li class="chat-box">
          <div class="chat-box__user">
            <p class="chat-box__user--name">${message.user_name}</p>
            <span class="chat-box__user--time">${message.created_at}</span>
          </div>
          <p class="chat-box__message">${message.body}</p>
          <image src="${image}">
        </li>`
        return html;
      }
  
    $('#message-form').on('submit', function(e) {
      e.preventDefault();   //同期通信するフォームをストップしている
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,   //どこのアクションに情報を飛ばしたいかを指定していあげる。この3つは基本的にいれる必要がある
        type: "POST",
        data: formData,   //送りたいデータの内容
        dataType: 'json',  //この3つは基本的にいれる必要がある（もしくはjson形式をリクエストする方法もある）
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
        alert('errors');
      })
    });
  
    setInterval(function() {
      $.ajax({
        url: location.href,
        type: "GET",
        dataType: 'json'
      })
      .done(function(data) {
        var html = '';
        var id = $('.chat-box').data('messageId');      
        data.messages.forEach(function(message) {
          console.log(id);
          console.log(message.id);
          if (message.id > id) {
            html += buildHTML(message);
          }
        });
        $('.main__body__chat-wrap').append(html);
      })
      .fail(function(data){
        alert('error');
      })
    }, 100000);
  });
});