$(document).on('turbolinks:load', function() {
  $( '#content_submit' ).click(function() {
    if ($('#comment_content').val()== '') {
      alert(I18n.t("no_comment"));
    }
  });   
});
