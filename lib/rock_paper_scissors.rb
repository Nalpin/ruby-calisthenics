class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    valid = ['R', 'P', 'S']
    play1 = player1[1]
    play2 = player2[1]
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless
      valid.include?(play1) && valid.include?(play2)
    case play1
    when 'R'
      return player1 unless play2 == 'P'
    when 'P'
      return player1 unless play2 == 'S'
    when 'S'
      return player1 unless play2 == 'R'
    end
    player2
  end

  def self.tournament_winner(tournament)
    player1 = tournament[0]
    player2 = tournament[1]
    return self.winner(player1, player2) unless player1[0].is_a? Array
    self.winner(self.tournament_winner(player1),self.tournament_winner(player2))
  end

end
