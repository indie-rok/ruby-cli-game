require "./Race"

class Hero < Race
  attr_accessor :health, :base_atack

  def initialize
    super(60, 10)
  end

  def cure
    @health += 10
  end
end
