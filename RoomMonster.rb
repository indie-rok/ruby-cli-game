require "./Room"

MONSTER_TYPE_FONT_COLOR_MAPPING = { "ground": "brown", "fire": "red", "grass": "green" }

class RoomMonster < Room
  def initialize(title, description, action_options, game_state)
    super(title, description, action_options, game_state)
    p @monster
    @monster = Monster.new
  end

  def attack
    @game_state[:hero].attack @monster
    @monster.attack @game_state[:hero]
  end

  def cure
    @game_state[:hero].cure
    @monster.scratch @game_state[:hero]
  end

  def up
    if @monster.health >= 0
      p "You can't pass until monster is dead"
    else
      super
    end
  end

  def renderOptions
    super()

    if @monster.health > 0
      puts "You find a " + @monster.type.send(MONSTER_TYPE_FONT_COLOR_MAPPING[@monster.type.to_sym]) + " monster"
      puts "monster health is #{@monster.health}"
      puts "heroHealth is #{@game_state[:hero].health}"
    elsif @monster.health <= 0
      puts "monster is dead"
      puts "YOU ARE VICTORIOUS"
    end

    @messages = []
  end
end
