require "./Room"

class WinningRoom < Room
  def initialize(title, action_options, game_state)
    super(title, action_options, game_state)
  end

  def renderOptions
    p "You won the game"
    @game_state[:hasWinGame] = true
  end
end
