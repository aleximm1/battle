class Game

  attr_reader :p1, :p2, :player_queue

  def initialize(p1, p2)
    @p1, @p2 = p1, p2
    @player_queue = [p1, p2]
    # @p2 = p2
  end

  def attack(player)
    player.receive_damage
    switch_player
  end

  def switch_player
    player_queue << player_queue.shift
  end

  def active_player
    player_queue.first.name
  end

  def loser
    player_queue.first.name if player_queue.first.dead?
  end

end
