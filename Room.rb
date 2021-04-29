class Room
  attr_accessor :messages

  def initialize(title, actionOptions, game_state)
    @title = title
    @action_options = actionOptions
    @game_state = game_state
    @messages = []
  end

  def up
    @game_state[:current_room] += 1
  end

  def down
    @game_state[:current_room] -= 1
  end

  def renderOptions
    puts "".center(20, "-")
    p "#{@title}. Your options are: #{@action_options.join("/")}"
  end
end
