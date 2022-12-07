require 'rspec'
require 'pry'
require './lib/board'
require './lib/player'

RSpec.describe Player do
    it 'exists and has a name' do
        player = Player.new("Benedict", "X")
        computer_player = Player.new("Beep Boop", "O")
        expect(player).to be_a(Player)
        expect(player.name).to eq("Benedict")
        expect(player.piece).to eq("X")
        expect(computer_player.piece).to eq("O")
    end
end