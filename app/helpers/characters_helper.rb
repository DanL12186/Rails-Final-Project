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

  def char_array
    @array = self.show.characters.pluck(:id)
  end

  # def index_start
  #   @character.char_array.find_index(@character.id) #works in view but not here yet
  #   #@index +=1 if @index <= (@character.char_array.length - 1)
  # end

end
