$(document).on('turbolinks:load', function() {
  $( '#content_submit' ).click(function() {
    if ($('#comment_content').val()== '') {
      alert(I18n.t("no_comment"));
    }
  });   

  $("#content_submit").click(function() {
    if ($('#comment_content').val() == "") {
      alert("Comment not empty")
    }
  });

  $("#select_league, #select-box-season, #select-box-round").on("change", function() {
    var league = $("#select_league").val();
    var season = $("#select_season").val();
    var round = $("#select_round").val();
    $.ajax({
      url: "/matchs",
      data: {
        round: round,
        season: season,
        league: league
      }
    })
  });
});
