class Player

  attr_accessor :id, :name, :avg

  def initialize(id, name, avg)
    @id = id
    @name = name
    @avg = avg
  end
end