class Race
  attr_accessor :health, :base_atack

  def initialize(health, base_atack)
    @health = health
    @base_atack = base_atack
    @messages = []
  end

  def attack(race)
    race.health -= @base_atack + self.generateRandomLuck(1..10)
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
