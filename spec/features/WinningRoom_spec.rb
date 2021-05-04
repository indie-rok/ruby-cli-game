# spec/features/mytest_spec.rb

require_relative "../../RoomEngine"

RSpec.describe "GameTests", :type => :request do

      describe "Winning Room" do
       it "should win the game after entering the room" do
        game_state = { hasWinGame: false }
        room = WinningRoom.new("Mock title", "Mock desc", ["mock actions"], game_state)

        room.renderOptions

        expect(room.game_state[:hasWinGame]).to eq true
       end
      end
  
  end