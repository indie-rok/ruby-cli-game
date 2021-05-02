class Room
  attr_accessor :messages

  def initialize(title, description, actionOptions, game_state)
    @title = title
    @action_options = actionOptions
    @description = description
    @game_state = game_state
    @messages = []
  end

  def up
    @game_state[:current_room] += 1
  end

  def down
    if @game_state[:current_room] <= 0
      p "There is nothing to go back"
    else
      @game_state[:current_room] -= 1
    end
  end

  def renderOptions
    puts "".center(20, "-")
    p "#{@title}. \ #{@description} \ What do you do? Options are: #{@action_options.join("/")}"
  end
end
