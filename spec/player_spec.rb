require 'rspec'
require 'pry'
require './lib/board'
require './lib/player'

RSpec.describe Player do
    it 'exists and has a name' do
        player = Player.new("Benedict")
        expect(player).to be_a(Player)
        expect(player.name).to eq("Benedict")
    end
end