# spec/features/mytest_spec.rb

require_relative "../../RoomEngine"

RSpec.describe "GameTests", :type => :request do
      describe "Monster" do
        it "should generate a random monster" do
          mo = Monster.new

          monster_types = MONSTER_TYPE.map { |mo| mo[:type] }
 
          expect(monster_types.include? mo.type).to be true
        end
      end 
  end