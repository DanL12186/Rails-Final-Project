// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//New character form submission
$(document).on('turbolinks:load', function () { //ensure turbolinks without refresh
  if ($("h1").html() === " New character ") { //clumsy way of ensuring only the new character page (and not all forms) are used.
    $("form").on("submit", function(event) {
      event.preventDefault();

      const uid = $(".user").data("uid")
      ,     sid = $("#character_show_id").val() //collection_select val
      ,     serializedForm = $(this).serialize()
      ,     characterCreation = $.post(`/users/${uid}/shows/${sid}/characters`, serializedForm);

      characterCreation.done(function(char) { //data currently character object

        class Character {
          constructor(char) {
          	this.name = char.name;
          	this.deceased = char.deceased;
          	this.dislike = char.dislike;
          	this.quote = char.quote;
          	this.note = char.note;
          	this.id = char.id;
          	this.show = char.show;

            this.toDom = () => {
              const status = (`Status: ${char.deceased ? "Deceased" : "Alive"}`)
              ,     hero = (this.dislike ? "Villain" : "Hero")
              ,     newCharacter = `<h3> ${this.name} </h3>
                                    <div> ${this.note} </div>
                                    <div><em> ${this.quote} </em></div>
                                    <div> ${status} </div>
                                    <div> ${hero} </div>`

              $("#newCharacters").append(newCharacter);
              $('form').trigger('reset');
            };
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
    let   counter = $(this).data("index"); //current index of the characters array
    const uid = $(this).data("uid")
    ,     sid = $(this).data("sid")
    ,     charIds = $(this).data("array") //index of character Ids from their shared show
    ,     nextId = charIds[counter];

    $.get(`/users/${uid}/shows/all/characters/${nextId}.json`, function(character) {

      $(".name").html(character.name);
      $(".species").html(character.species ? `Species: ${character.species}` : null);
      $(".note").html(character.note);
      $(".quote").html(character.quote);
      $(".status").html(`Status: ${character.deceased ? "Deceased" : "Alive"}`);
      $(".hero").html(`${character.dislike ? "Villain" : "Hero"}`);
      $(".edit").html(`<a href="/users/${uid}/shows/${character.show.id}/characters/${character.id}/edit">Edit ${character.name}</a>`);
      $(".delete").html(`<a href="/users/${uid}/shows/${character.show.id}/characters/${character.id}">Delete ${character.name}</a>`);
      // reset the counter (data-index) to 0 if array end is reached, else increment
      counter < (charIds.length - 1) ? $(".js-next").data("index", ++counter) : $(".js-next").data("index", 0);
    });
  });
});

//JS-MORE for viewing more info (quotes and notes) on character index page for a given character
$(document).on('turbolinks:load', function() {
  $(".js-more").on("click", function() {
    const id = $(this).data("id")
    ,     uid = $(this).data("uid")
    ,     sid = $(this).data("sid")
    ,     addQuote = `<a href="/users/${uid}/shows/${sid}/characters/${id}/edit">Add a quote</a>`
    ,     addNote = `<a href="/users/${uid}/shows/${sid}/characters/${id}/edit">Add a note</a>`;

    $.get(`/users/${uid}/shows/all/characters/${id}.json`, function(charData) {
      $(`#note-${id}`).html(`Note: ${charData.note}`);
      //display quote if exists, else render edit link
      charData.quote ? $(`#quote-${id}`).html(`Quote: <em>${charData.quote}</em>`) : $(`#quote-${id}`).html(addQuote);
      charData.note ? $(`#note-${id}`).html(`Notes: ${charData.note}`) : $(`#note-${id}`).html(addNote);
    });
  });
});
