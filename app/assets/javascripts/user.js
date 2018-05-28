$(document).on('turbolinks:load', function() {
  $(function() {

    function appendUserList(user) {
      var html = `<div class="chat-group-user clearfix">
                    <p class="chat-group-user__name">${user.name}</p>
                    <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                  </div>`
      return html;
    }

    function addHiddenField(id, name) {
      var html = `<div class="chat-group-user clearfix">
                    <input type="hidden" name="group[user_ids][]" value="${id}">
                    <p class="chat-group-user__name">${name}</p>
                    <a class="user-search-add chat-group-user__btn
                    chat-group-user__btn--add remove "data-user-id="${id}" data-user-name="${name}">削除</a>
                  </div>`
      return html;
    }

    $(".chat-group-form__input").on("keyup", function() {
      var input = $("#user-search-field").val();
      if (!input) {
        return false;
      };
      $.ajax({
        url: '/users',
        type: 'GET',
        data: { text: input },
        dataType: 'json'
      })
      .done(function(users) {
        var list = "";
        if (users.length !== 0) {
          users.forEach(function(user){
            list += appendUserList(user);
          });
          $('#user-search-result').append(list);
        }
      })
      .fail(function() {
        alert('ユーザー検索に失敗しました');
      });
      $('#user-search-result').empty();
    });

    $('#user-search-result').on('click', '.user-search-add', function() {
      console.log(this);
      
      var id = $(this).data('user-id');
      var name = $(this).data('user-name');
      var html = addHiddenField(id, name);
      $('.js-add-user').append(html);
      $(this).parent().remove();
    });

    $('.js-add-user').on('click', '.remove', function() {
      $(this).parent().remove();
    });

  });
});

