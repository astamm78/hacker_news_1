$(document).ready(function() {

  $('p.voting a').click(function(event) {
    event.preventDefault();
    var anchor = $(this);
    var url = $(this).attr('href');
    $.post(url, function(results) {
      anchor.parent().parent().find('p.vote_results').html(results);
      anchor.parent().hide(); 
    });
  });

});
