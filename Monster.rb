require "./Race"

GROUND_MONSTER = { type: "ground", health: 150, base_attack: 10 }
FIRE_MONSTER = { type: "fire", health: 20, base_attack: 30 }
ELECTRIC_MONSTER = { type: "fire", health: 50, base_attack: 50 }

MONSTER_TYPE = [GROUND_MONSTER, FIRE_MONSTER, ELECTRIC_MONSTER]

class Monster < Race
  attr_accessor :health, :base_attack

  def initialize
    random_monster = MONSTER_TYPE.sample
    super(random_monster[:health], random_monster[:base_attack], random_monster[:type])
  end
end
