require "./Monster"
require "./Hero"
require "./Room"
require "./RoomMonster"
require "./WinningRoom"
require "./String"

class RoomEngine   
  def initialize
    @game_state = { current_room: 0, hasWinGame: false, hero: Hero.new }
    @rooms = [
      Room.new("Wake up room", "You just wake up from a sleep. You are in a cave alone. You see a room infront of you.", ["up", "down"], @game_state),
      Room.new("Fire Room", "You read on the wall: careful, fire monsters attack strongly but have low defense", ["up", "down"], @game_state),
      Room.new("Earth Room", "You read on the wall: You will need patiance with Earth. Slow and steady. High defense, low atack", ["up", "down"], @game_state),
      Room.new("Grass Room", "You read on the wall: Grass is the perfect balance. You will need both attack and defence.", ["up", "down"], @game_state),
      RoomMonster.new("Monster Room", "OH CRAP! THERE IS A MONSTER IN FRONT OF YOU", ["up", "down", "attack", "cure"], @game_state),
      WinningRoom.new("Exit room", "You see the exit and you can leave", ["exit", "view stats"], @game_state),
    ]
  end

  def start
    while true
      if @game_state[:hero].is_dead?
        p "HERO IS DEAD--YOU NEED TO START OVER"
        break
      end

      current_room = @rooms[@game_state[:current_room]]
      current_room.renderOptions
      break if @game_state[:hasWinGame] == true
      puts "> Your call:"
      action = gets.chomp
      
      begin
        current_room.send(action)
      rescue
        p "wrong option"
      end
    end
  end
end
