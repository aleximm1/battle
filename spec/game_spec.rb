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

  describe '#player_queue' do
    it "gives us the player whose turn it is" do
      expect(game.player_queue.first.name).to eq "Narayan"
    end
  end

  describe '#switch_player' do
    it "puts the previous player at the back of the queue" do
      expect{ game.switch_player }.to change{ game.player_queue.first }
      expect(game.player_queue.last.name).to eq "Narayan"
    end
  end

  describe '#loser' do
    it "returns nil if no one has lost" do
      expect(game.loser).to be nil
    end
    it "returns the loser's name when they've no hp" do
      10.times { game.attack(game.p2)}
      game.switch_player
      expect(game.loser).to eql "Alex"
    end
  end

end
