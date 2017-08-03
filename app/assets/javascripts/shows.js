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
    // add event listern to button that shows or hides the form
    $("#add_character").on("click", function() {
      const form = $("#shows_character_form")//[0]
      const display = form[0].style.display

      if (display !== "block") {    // if (!display) form.style.display = 'block';
        form.slideDown(450)
        this.innerHTML = "Cancel"

    } else {
        form.slideUp(450)
        this.innerHTML = "Add Character"
      }
  });

      $("shows_character_form").on("submit", function(event) {

        event.preventDefault();

        const uid = $(".user").data("uid");
        const sid = $("#character_show_id").val() //collection_select val

        const serializedForm = $(this).serialize();
        const characterCreation = $.post(`/users/${uid}/shows/${sid}/characters`, serializedForm);

        characterCreation.done(function(char) { //data currently character object

          const newCharacter = `<h3> <a href="/users/${uid}/shows/${sid}/characters/${char.id}">${char.name}</a> </h3>`

          $("#jQuery_add_character").append(newCharacter);
          $('form').trigger('reset');

        });
    });
 });
