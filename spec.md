# Specifications for the Rails Assessment

jQuery Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
- [ ] Translate JSON responses into js model objects.
- [ ] At least one of the js model objects must have at least one method added by your code to the prototype.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message


Rails Specs:
- [x] Using Ruby on Rails for the project

  **Running on Rails 5.1**

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)

  **A User has_many Shows; a Show has_many Characters. A Show belongs_to a User, a Character belongs_to a Show**

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

  **A User has_many Characters, through: Shows. A Show has a name set by the User.**

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

  **A password has a min length and must be confirmed when signing up. Emails must be unique across Users if supplied, shows and characters must have a name and parent id.**

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

  **Two scopes, "like" and "alive" checks for characters that are, respectively, neither deceased nor disliked by the user. They have been chained together in the characters/favorite_characters view to create a simple display of a user's favorite, extant characters.**

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)

  **Show creation is done via a nested form with a custom writer, ensuring a show can be created without a character**

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)

  **Covered in the ReadMe**

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)

  **Routes are nested (users/:id/shows/:id/characters/:id)**

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

  **Errors are displayed on page via an errors partial when validations fail**

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

  **Did my best to limit redundancy and code smells, abstract logic into models and helpers, and use partials.**
