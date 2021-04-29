class Race
  attr_accessor :health, :attack_power

  def initialize(health, attack_power)
    @health = health
    @attack_power = attack_power
    @messages = []
  end

  def attack(race)
    race.health -= self.attack_power
  end

  def is_dead?
    @health <= 0
  end
end

class Monster < Race
  attr_accessor :health, :attack_power

  def initialize
    super(50, 20)
  end
end

class Hero < Race
  attr_accessor :health, :attack_power

  def initialize
    super(60, 10)
  end
end

class Room
  def initialize(title, actionOptions, game_state)
    @title = title
    @action_options = actionOptions
    @game_state = game_state
  end

  def up
    @game_state[:current_room] += 1
  end

  def down
    @game_state[:current_room] -= 1
  end

  def renderOptions
    p "#{@title}. Your options are: #{@action_options.join("/")}"
  end
end

class RoomMonster < Room
  def initialize(title, action_options, game_state)
    super(title, action_options, game_state)
    @monsterHealth = 100
    @heroHealth = 100
  end

  def attack
    damageToMonster = rand(1..10)
    damageToHero = rand(1..10)
    @monsterHealth -= damageToMonster
    @heroHealth -= damageToHero
  end

  def cure
    if @heroHealth == 100
      p "You can't heal more"
    else
      @heroHealth += rand(1..10)
    end
  end

  def up
    if @monsterHealth > 0
      p "You need to kill the monster first"
    end
  end

  def renderOptions
    super()
    p "monster health is #{@monsterHealth}"
    p "heroHealth is #{@heroHealth}"
  end
end

class WinningRoom < Room
  def initialize(title, action_options, game_state)
    super(title, action_options, game_state)
  end

  def renderOptions
    p "You won the game"
    @game_state[:hasWinGame] = true
  end
end

class RoomEngine
  def initialize
    @game_state = { current_room: 0, hasWinGame: false }
    @rooms = [
      # Room.new("First Room", ["up", "down"], @game_state),
      # Room.new("Second Room", ["up", "down"], @game_state),
      RoomMonster.new("Monster Room", ["attack", "cure", "down"], @game_state),
      WinningRoom.new("Exit room", ["exit", "view stats"], @game_state),
    ]
  end

  def start
    while true
      current_room = @rooms[@game_state[:current_room]]
      current_room.renderOptions
      break if @game_state[:hasWinGame] == true
      action = gets.chomp
      begin
        current_room.send(action)
      rescue
        p "wrong option"
      end
    end
  end
end

r = RoomEngine.new
r.start
