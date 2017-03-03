require 'game'

describe Game do
  subject(:game) { described_class.new(Player.new("Narayan"), Player.new("Alex")) }
  let(:player) { double :player }
  describe '#attack' do
    it "tries to damage the player" do
      expect(player).to receive(:receive_damage)
      game.attack(player)
    end
    it "reduces a player's hp" do
      alex = Player.new("Alex")
      expect{game.attack(alex)}.to change{ alex.hp }.by -10
    end
  end

  describe '#p1' do
    it 'returns player 1' do
      expect(game.p1).to be_an_instance_of Player
    end
  end

  describe '#p2' do
    it 'returns player 2' do
      expect(game.p2).to be_an_instance_of Player
    end
  end
end
