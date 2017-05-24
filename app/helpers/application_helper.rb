module ApplicationHelper

  def happiness
    unless self.characters.empty?
      count = 0
      self.characters.each {|char| (char.dislike && !char.deceased || !char.dislike && char.deceased) ? count -= 0.5 : count += 0.5}
    end
    ((count / self.characters.size * 100) + 50).round(1)
  end

  def happiest
    @shows.select {|show| !show.characters.empty?}.max_by { |show| show.happiness }
  end

  def sort_by_name_length(index)
    index.sort_by { |show| show.name.length }
  end

  def number_to_word(number)
    numbers = {
      1=>"One", 2=>"Two", 3=>"Three", 4=>"Four", 5=>"Five",
      6=>"Six", 7=>"Seven", 8=>"Eight", 9=>"Nine"
     }
    numbers.select { |num| number == num }.values.join
  end

end
