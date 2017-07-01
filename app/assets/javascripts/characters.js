// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function () { //ensure turbolinks without refresh
  $('form').submit(function(event) {
    event.preventDefault();

    const uid = $(".user").data("uid");
    const sid = $("#character_show_id").val() //collection_select val
    const serializedForm = $(this).serialize();
    const characterCreation = $.post(`/users/${uid}/shows/${sid}/characters`, serializedForm);

    characterCreation.done(function(char) { //data currently character object

      function Character(char) {
      	this.name = char.name;
      	this.deceased = char.deceased
      	this.dislike = char.dislike
      	this.quote = char.quote
      	this.note = char.note
      	this.id = char.id
      	this.show = char.show
        this.toDom = function() {

          const status = (`Status: ${char.deceased ? "Deceased" : "Alive"}`)
          const hero = (this.dislike ? "Villain" : "Hero")
          const newCharacter = `<h3> ${this.name} </h3>
                                <div> ${this.note} </div>
                                <div><em> ${this.quote} </em></div>
                                <div> ${status} </div>
                                <div> ${hero} </div>`

          $("#newCharacters").append(newCharacter);
          $('form').trigger('reset');
        };
      };
      const character = new Character(char);
      character.toDom();
    });
  });
});
