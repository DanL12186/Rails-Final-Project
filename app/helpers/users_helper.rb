module UsersHelper

  def show_with_most_characters
    @largest_show = current_user.shows.max_by { |show| show.characters.size }
  end
end
