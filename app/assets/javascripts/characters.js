// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function () {
  $('form').submit(function(event) {
    event.preventDefault();

    const uid = $(".user").data("uid");
    const sid = $("#character_show_id").val() //collection_select val
    const serializedForm = $(this).serialize();
    const characterCreation = $.post(`/users/${uid}/shows/${sid}/characters`, serializedForm);

    characterCreation.done(function(char) { //data currently character object

      const status = (`Status: ${char.deceased ? "Deceased" : "Alive"}`)
      const hero = (char.dislike ? "Villain" : "Hero")
      const newCharacter = `<h3> ${char.name} </h3>
                            <div> ${char.note} </div>
                            <div><em> ${char.quote} </em></div>
                            <div> ${status} </div>
                            <div> ${hero} </div>`

      $("#newCharacters").append(newCharacter);

      $('form').trigger('reset');
    });
  });
});
