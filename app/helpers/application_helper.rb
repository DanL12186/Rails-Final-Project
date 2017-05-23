module ApplicationHelper

  def happiness
    count = 0
    self.characters.each {|char| (char.dislike && !char.deceased || !char.dislike && char.deceased) ? count -= 0.5 : count += 0.5}
    ((count.to_f / self.characters.size) * 100) + 50
  end
    
end
