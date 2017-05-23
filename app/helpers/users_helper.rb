module UsersHelper

  def show_with_most_characters
    current_user.shows.max_by {|show| show.characters.size}.name
  end
end
