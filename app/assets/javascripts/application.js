//= require jquery
//= require jquery_ujs
//= require turbolinks

(function($) {
  function hide() {
    $('.new-post__url, .new-post__body, .new-post__submit')
      .hide();
  }

  $('.new-post__toggle').on('click', function(event) {
    event.preventDefault();

    hide();

    var target = '.new-post__' + $(this).data('toggle');
    $(target).show();

    $('.new-post__submit').show();

    $('.new-post__toggle').removeClass('button--primary');
    $(this).addClass('button--primary');
  });

  hide();
})(jQuery);
