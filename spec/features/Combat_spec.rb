# spec/features/mytest_spec.rb

require_relative "../../RoomEngine"

RSpec.describe "GameTests", :type => :request do

      describe "Combat" do
        it "should decrease the health after an attack" do
          monster = Monster.new
          hero = Hero.new

          monster_initial_health = monster.health

          hero.attack monster

          expect(monster.health).to be < monster_initial_health
        end

        it "should have less power with scratch than with attack" do

            monster = Monster.new
            hero_to_be_attacked = Hero.new
            hero_to_be_scratched = Hero.new

            allow(monster).to receive(:generateRandomLuck).and_return(3)

            monster.attack hero_to_be_attacked
            monster.scratch hero_to_be_scratched
  
            expect(hero_to_be_attacked.health).to be < hero_to_be_scratched.health
        end

        it "returns true when monster is death" do
            monster = Monster.new
            hero = Hero.new

            allow(monster).to receive(:health).and_return(10)
            allow(hero).to receive(:base_attack).and_return(11)

            expect(monster.is_dead?).to eq false

            hero.attack monster

            expect(monster.is_dead?).to eq true

        end
      end 
  
  end