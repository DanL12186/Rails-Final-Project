// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//New character form submission
$(document).on('turbolinks:load', function () { //ensure turbolinks without refresh
  if ($("h1").html() === " New character ") { //clumbsy way of ensuring only the new character page (and not all forms) are used.
    $("form").submit(function(event) {
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
  };
});

//JS-NEXT for scrolling through characters' show pages
$(document).on('turbolinks:load', function () {
  $(".js-next").on("click", function(event) {
    event.preventDefault();
    console.log("HI")
    let uid = $(this).data("uid"); //("js-next"); .data("uid") === .attr("data-uid")
        sid = $(this).data("sid");

        charIds = $(this).data("array"); //index of character Ids from their shared show
        counter = $(this).data("index"); //current index of the characters array
        nextId = charIds[counter];

    $.get(`/users/${uid}/shows/all/characters/${nextId}.json`, function(character) {

      $(".name").html(character.name);
      $(".note").html(character.note);
      $(".quote").html(character.quote ? character.quote : "");
      $(".status").html(`Status: ${character.deceased ? "Deceased" : "Alive"}`)
      $(".hero").html(`${character.dislike ? "Villain" : "Hero"}`)
      $(".edit").html(`<a href="/users/${uid}/shows/${character.show.id}/characters/${character.id}/edit">Edit ${character.name}</a>`)
      $(".delete").html(`<a href="/users/${uid}/shows/${character.show.id}/characters/${character.id}">Delete ${character.name}</a>`)
      // reset the counter (data-index) to 0 if array end is reached, else increment
      counter === (charIds.length - 1) ? $(".js-next").data("index", 0) : $(".js-next").data("index", counter += 1);
    });
  });
});
