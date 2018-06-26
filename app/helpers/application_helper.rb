module ApplicationHelper

  def happiness
    return 0 if self.characters.empty?
    count = 0.0
    unhappy_characters = self.characters.count { |char| !char.dislike && char.deceased || char.dislike && !char.deceased }
    count += (self.characters.size - unhappy_characters)/2
    count -= unhappy_characters/2
    return ((count / self.characters.size * 100) + 50).round(1)
  end

  def happiest
    @shows.max_by(&:happiness)
  end

  def sort_by_name_length(show_list)
    show_list.sort_by { |show| -show.name.length }
  end

  def number_to_word(number)
    numbers = {  1=> "One", 2=> "Two", 3=> "Three", 4=> "Four", 5=> "Five",
                 6=> "Six", 7=> "Seven", 8=> "Eight", 9=> "Nine"  }
    numbers[number]
  end

  def icons
    icons = ["/assets/favicon-red.ico", "/assets/favicon.ico"].sample
  end
end
