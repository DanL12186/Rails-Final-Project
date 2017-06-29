module ApplicationHelper

  def happiness
    count = 0
    return nil if self.characters.empty?
    self.characters.each {|char| (char.dislike && !char.deceased || !char.dislike && char.deceased) ? count -= 0.5 : count += 0.5}
    ((count / self.characters.size * 100) + 50).round(1)
  end

  def happiest
    @shows.max_by { |show| show.happiness }
  end

  def sort_by_name_length(show_list)
    show_list.sort_by { |show| show.name.length }.reverse
  end

  def number_to_word(number)
    numbers = {
      1=>"One", 2=>"Two", 3=>"Three", 4=>"Four", 5=>"Five",
      6=>"Six", 7=>"Seven", 8=>"Eight", 9=>"Nine"
     }
    numbers.detect { |num| num[0] == number }[1]
  end

  def icons
    icons = ["/assets/favicon-red.ico", "/assets/favicon.ico"].sample
  end
end
