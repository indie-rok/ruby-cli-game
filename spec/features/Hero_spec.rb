# spec/features/mytest_spec.rb

require_relative "../../RoomEngine"

RSpec.describe "GameTests", :type => :request do

    describe "Hero" do
        it "initialize the hero with with correct state" do
          he = Hero.new
          
          expect(he.health).to eq(60)
          expect(he.type).to eq("human")
          expect(he.base_attack).to eq(10)

        end

        it "should cure hero after invoke of method" do
            he = Hero.new

            expect(he.health).to eq(60)
            he.cure
            expect(he.health).to be > 60
        end
    end

  
  end