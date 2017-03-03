require 'game'

describe Game do
  subject(:game) { described_class.new }
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
end
