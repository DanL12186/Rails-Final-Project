// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//display a given show's characters on Shows index page

$(document).on('turbolinks:load', function () {
  $(".js-shows").on("click", function(event) {
    const uid = $(this).data("uid");
    const sid = $(this).data("sid");
    const charDiv = $(`#chars-${sid}`)

    if (charDiv.html() === '') { //fire following and display info unless previously done

      event.preventDefault();
      charDiv.toggle(); //make invisible w/o writing CSS.

      $.get(`/users/${uid}/shows/${sid}.json`, function(showData) {
        showData.characters.forEach(function(character) {

          charDiv.append(`<ul><li><a href="/users/${uid}/shows/${sid}/characters/${character.id}">${character.name}</a</li></ul>`)
          charDiv.append(`<ul><em>${character.note}</em></ul><br>`)
          charDiv.fadeIn(900) //now fade in
        });
        //charDiv.slideDown(400); alternatively slideDown works here.
      });
    };
  });
});
