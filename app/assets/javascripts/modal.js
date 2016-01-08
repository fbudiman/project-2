$(function() {

  function hideAndShow(hide, show) { // hides and shows divs (modals)
    $(hide).css('display', 'none');
    $(show).css('display', 'block');
  };

  $("#login-link").click(function() {
    $("#modal-login").css('display', 'block');
    $("#modal-login").css('position', 'fixed');
  })


});
