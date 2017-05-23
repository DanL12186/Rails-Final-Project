module ApplicationHelper

  def happiness
    count = 0
    self.characters.each {|char| (char.dislike && !char.deceased || !char.dislike && char.deceased) ? count -= 0.5 : count += 0.5}
    ((count.to_f / self.characters.size * 100) + 50).round(1)
  end

  def happiest
    @shows.max_by { |show| show.happiness }
  end

  def sort_by_name_length
    @shows.sort_by { |show| show.name.length }
  end

end
