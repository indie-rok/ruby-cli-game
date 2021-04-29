require "./Monster"
require "./Hero"
require "./Room"
require "./RoomMonster"
require "./WinningRoom"

class RoomEngine
  def initialize
    @game_state = { current_room: 0, hasWinGame: false, hero: Hero.new }
    @rooms = [
      # Room.new("First Room", ["up", "down"], @game_state),
      # Room.new("Second Room", ["up", "down"], @game_state),
      RoomMonster.new("Monster Room", ["attack", "cure", "down", "up"], @game_state),
    # WinningRoom.new("Exit room", ["exit", "view stats"], @game_state),
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
      puts "> "
      action = gets.chomp
      current_room.send(action)

      # begin
      #   current_room.send(action)
      # rescue
      #   p "wrong option"
      # end
    end
  end
end

r = RoomEngine.new
r.start
