//
//
//
//
//
// $(document).on('turbolinks:load', function () {
//
//   // ** Event Listeners **
//   $(".js-shows").on("click", function(event) {
//
//     const charDiv = $(`#chars-${sid}`)
//
//     if (charDiv.html() === '') {
//       event.preventDefault();
//       charDiv.toggle();
//       ShowCharacterAPIService.getShowCharacters(sid, uid, ({ characters }) => renderCharactersToElement(characters, charDiv))
//     };
//   });
//
//   $("#add_character").on("click", function() {
//     const form = $("#shows_character_form")[0]
//     const { display } = form.style;
//
//     if (display !== "block") {
//       form.slideDown(450)
//       this.innerHTML = "Hide Form"
//     } else {
//       form.slideUp(450)
//       this.innerHTML = "Add Character"
//     }
//   });
//
//   $("#new_character").on("submit", function(event) {
//     event.preventDefault();
//
//     const uid = $(".user").data("uid");
//     const sid = $("#character_show_id").val();
//     const formData = $(this).serialize();
//     const charDiv = $(`#chars-${sid}`)
//
//     ShowCharacterAPIService.creatShowCharacter(sid, uid, formData, (character) => {
//       $('form').trigger('reset');
//       renderCharacterToElement(character, charDiv);
//     })
//
//   // ** API Calls **
//   const ShowCharactersAPIService = {
//     getShowCharacters(sid, uid, callback) {
//       return $.get(`/users/${uid}/shows/${sid}.json`, callback)
//     },
//
//     createShowCharacter(sid, uid, callback) {
//       return $.post(`/users/${uid}/shows/${sid}/characters`, serializedForm)
//         .then(character => (callback(character))
//     }
//   }
//
//   // ** DOM Manipulation **
//   const renderCharactersToElement = (characters, element) => {
//     element.append(characters.map(character => renderCharacter(character)))
//   }
//
//   const renderCharacter = character => {
//     return (`
//       <ul>
//         <li>
//           <a href="/users/${uid}/shows/${sid}/characters/${character.id}">
//             ${character.name}
//           </a>
//         </li>
//       </ul>
//       <ul>
//         <em>${character.note}</em>
//       </ul>
//       <br>
//     `);
//   }
// });
