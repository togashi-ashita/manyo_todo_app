$(document).on('click', '#showCompleatedtask', function (e) {
  e.preventDefault();
  $('.compleated').toggle();
});

// 検索部分
$(function() {
  var
  preFunc = null,
  preInput = '',
  input = '',
  ajaxPost = function(input)
  {
    $.ajax({
      url: "/tasks/search_tasks",
        type: "GET",
        data: ("q=" + input)
    });
  };

  $('#search_tasks').on('keyup', function() {
    input = $.trim($(this).val());   //前後の不要な空白を削除
    if(preInput !== input){
      clearTimeout(preFunc);
      preFunc = setTimeout(ajaxPost(input), 1000);
    }
    preInput = input;
  });
});
