# spec/features/mytest_spec.rb

require_relative "../../RoomEngine"

RSpec.describe "GameTests", :type => :request do

      describe "Room" do

        it "increment the game room when instructed" do
            game_state = { current_room: 0 }
            room = Room.new("Mock title", "Mock desc", ["mock actions"], game_state)

            room.up

            expect(room.game_state[:current_room]).to eq 1
        end

        it "descrement the game room when instructed" do
            game_state = { current_room: 1 }
            room = Room.new("Mock title", "Mock desc", ["mock actions"], game_state)

            room.down

            expect(room.game_state[:current_room]).to eq 0
        end

        it "should  not allow to decrement when not possible" do
            game_state = { current_room: 0 }
            room = Room.new("Mock title", "Mock desc", ["mock actions"], game_state)

            room.down

            expect(room.game_state[:current_room]).to eq 0
        end

      end

   
  end