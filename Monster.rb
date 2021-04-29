require "./Race"

class Monster < Race
  attr_accessor :health, :base_atack

  def initialize
    super(5, 20)
  end
end
