require "./Race"

class Hero < Race
  attr_accessor :health, :base_attack

  def initialize
    super(60, 10, "human")
  end

  def cure
    @health += 10
  end
end
