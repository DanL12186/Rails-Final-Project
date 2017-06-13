# README

## Installation

  Note: This application has only been tested on Rails 5.1 running Ruby 2.4.1.

  Installation should be relatively simple; simply fork, clone, download or otherwise acquire the repo, cd into the directory and bundle install. Run the migrations with rake db:migrate (or, optionally, rails db:migrate in Rails 5+), and then start the server with rails s, or rails server if you really enjoy typing. You may wish to open a second terminal tab (if supported by your IDE/environment) in order to simultaneously run the rails console ('rails c').

  (Note that this project runs by default on Rails 5.1 or later, which requires Ruby v2.2.2 and above. It will likely run on Rails ~4.2, which runs just fine on Ruby 2.0.0. You will however have to delete the GemFile.lock, and modify the Rails version in the GemFile. You may or may not have to tweak other gem versions.)

  The test suite can be run with the following command, sans single quotes: 'rails test test/folder_name/test_name.rb' (e.g. 'rails test test/controllers/users_controller_test.rb'). Alternatively, 'rails test' will run all tests.

  If you run into any issues that weren't there before, resetting the cache via the 'rake tmp:cache:clear' command may solve them.

## Features

  *Logging in and out*

  This is a basic Rails app, in which a user may sign up (either via the site itself or via Facebook), sign out, and log in (again either manually or via Facebook). At this juncture, the minimum password length has been set to 4 to ease testing purposes, but that can easily be changed, and further restrictions may be added with additional validations.

  *Use*

  The main point of this application (in addition to flexing some of Rails' fundamental features) is for users to be able to add television shows and characters they like. This is done manually (no scraping or provided databases), and allows users a certain flexibility in the sense that they can add any number of characters to any show they wish. There is, by design, the potential for redundancy in the database between users; any number of users, for example, may have their own personal "Game of Thrones" entry in the database. This could have been avoided with added complexity, but I didn't wish for the user's creation process to be affected by existing data, and I felt it would have been outside of the scope of this project.

  Note that there are constraints on what a user can do within their own account, however; they may not add multiple characters to the same show with the same name, nor may they add two shows with the same name. When creating a single new character, they may only choose from an existing show that they themselves have already created.

  A user may view all of his characters at once, views his favorite characters who are still alive ("favorite" just means the user has indicated they "like" the character), view all their shows by name, view shows individually displaying character info within that show, and view characters individually. Full CRUD is also implemented; a user may delete any individual character, show, and even their own account. Deleting a parent object also destroys all its descendants. A few basic statistics have been added, such as displaying the number of shows a user has and the show with the most characters. No cross-user comparison features have been implemented.

## Contributing

  Bug reports and pull requests are welcome on GitHub at https://github.com/DanL12186/Rails-Final-Project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

  The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
