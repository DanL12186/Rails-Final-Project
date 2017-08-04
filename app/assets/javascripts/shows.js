// All this logic will automatically be available in application.js.

//display a given show's characters on Shows index page

$(document).on('turbolinks:load', function () {

  // ** Event Listeners **
  $(".js-shows").on("click", function(event) {
    const { uid, sid } = this.dataset;
    const charDiv = $(`#chars-${sid}`)

    if (charDiv.html() === '') { //display info unless previously done
      event.preventDefault();
      charDiv.toggle(); //hide

      $.get(`/users/${uid}/shows/${sid}.json`, function(showData) {
        showData.characters.forEach(function(character) {

          charDiv.append(`<ul><li><a href="/users/${uid}/shows/${sid}/characters/${character.id}">${character.name}</a</li></ul>`)
          charDiv.append(`<ul><em>${character.note}</em></ul><br>`)
          charDiv.fadeIn(900)
        });
      });
    };
  });

  $("#add_character").on("click", function() {
    const form = $("#shows_character_form")
    const { display } = form[0].style;

    if (display !== "block") {
      form.slideDown(450)
      this.innerHTML = "Hide Form"
    } else {
      form.slideUp(450)
      this.innerHTML = "Add Character"
    }
  });

    if ($("h1").html() !== " New character ") {
      $("#new_character").on("submit", function(event) {
        event.preventDefault();

        const uid = $(".user").data("uid");
        const sid = $("#character_show_id").val() //collection_select
        const formData = $(this).serialize();
        const characterCreation = $.post(`/users/${uid}/shows/${sid}/characters`, formData);

        characterCreation.done(function(char) {
          const newCharacter = `<h3> <a href="/users/${uid}/shows/${sid}/characters/${char.id}">${char.name}</a> </h3>`
          $("#jQuery_add_characters").append(newCharacter);
          $('form').trigger('reset');
       });
    });
  };
});
