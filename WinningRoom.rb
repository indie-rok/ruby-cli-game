require "./Room"

class WinningRoom < Room
  def initialize(title, description, action_options, game_state)
    super(title, description, action_options, game_state)
  end

  def renderOptions
    p "You won the game"
    @game_state[:hasWinGame] = true
  end
end
