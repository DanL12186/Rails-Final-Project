module ApplicationHelper

  def happiness
    count = 0
    unless self.characters.empty?
      self.characters.each {|char| (char.dislike && !char.deceased || !char.dislike && char.deceased) ? count -= 0.5 : count += 0.5}
      ((count / self.characters.size * 100) + 50).round(1)
    end
  end

  def happiest
    shows_with_characters = @shows.select {|show| !show.characters.empty?}
    shows_with_characters.max_by { |show| show.happiness }
  end

  def sort_by_name_length
    @shows.sort_by { |show| show.name.length }
  end

end
