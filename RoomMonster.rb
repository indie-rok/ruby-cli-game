require "./Room"

class RoomMonster < Room
  def initialize(title, action_options, game_state)
    super(title, action_options, game_state)
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
      @messages.push "You can't pass until monster is dead"
    else
      super
    end
  end

  def renderOptions
    super()
    @messages = []

    if @monster.health > 0
      @messages.push "monster health is #{@monster.health}"
      @messages.push "heroHealth is #{@game_state[:hero].health}"
    elsif @monster.health <= 0
      @messages.push "monster is dead"
      @messages.push "YOU ARE VICTORIOUS"
    end

    puts "#{@messages.join("\n")}"
  end
end
