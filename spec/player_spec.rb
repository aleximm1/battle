require 'player'

describe Player do

  subject(:player) {described_class.new("Narayan")}

  describe '#name' do

    it 'checks that the player name is set' do
      expect(player.name).to eq "Narayan"
    end
  end

  describe '#hp' do

    it 'checks the player hp is set to max on initialize' do
      expect(player.hp).to eq 100
    end
  end

  describe '#receive_damage' do

    it 'lowers the players hp by 10' do
      expect(player.receive_damage).to eq 90
    end
  end
end
