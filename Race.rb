class Race
  attr_accessor :health, :base_attack, :type

  def initialize(health, base_attack, type)
    @health = health
    @base_attack = base_attack
    @type = type
    @messages = []
  end

  def attack(race)
    race.health -= @base_attack + self.generateRandomLuck(1..10)
  end

  def scratch(race)
    race.health -= self.generateRandomLuck(1..5)
  end

  def generateRandomLuck(between)
    rand(between)
  end

  def is_dead?
    @health <= 0
  end
end
