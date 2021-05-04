# spec/features/mytest_spec.rb

require_relative "../../RoomEngine"

RSpec.describe "GameTests", :type => :request do

      describe "RoomMonster" do
        
        it "should allow hero to recive damage from monster" do
            hero = Hero.new
            current_hero_health = hero.health
            game_state = { current_room: 0, hero: hero }
            room = RoomMonster.new("Mock title", "Mock desc", ["mock actions"], game_state)
            room.attack

            expect(hero.health).to be < current_hero_health
        end

        it "should allow hero to heal in room" do
            hero = Hero.new
            current_hero_health = hero.health
            game_state = { current_room: 0, hero: hero }
            room = RoomMonster.new("Mock title", "Mock desc", ["mock actions"], game_state)
            
            room.cure

            expect(hero.health).to be > current_hero_health
        end

        it "should dont allow do pass if monster is not dead" do
            hero = Hero.new
            game_state = { current_room: 0, hero: hero }
            room = RoomMonster.new("Mock title", "Mock desc", ["mock actions"], game_state)
            
            room.up

            expect(room.game_state[:current_room]).to eq 0
        end
      end
  
  end