module CharactersHelper

  def user
    self.show.user
  end

  def status
    self.deceased ? "Deceased" : "Alive"
  end

  def hero? #this does, of course, presuppose that the user likes heroes and dislikes villains.
    self.dislike ? "Villain" : "Hero"
  end

end
