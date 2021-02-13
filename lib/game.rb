class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #right diagonal
    [2,4,6] #left diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    cells = self.board.cells
    winning_combo = nil
    p1_positions = cells.each_index.select{|i| cells[i] == "X"}
    p2_positions = cells.each_index.select{|i| cells[i] == "O"}
    WIN_COMBINATIONS.each do |combo|
      p1_win = combo - p1_positions
      p2_win = combo - p2_positions
      winning_combo = combo if p1_win.empty? || p2_win.empty?
    end
    winning_combo
  end

  def draw?
    self.board.turn_count == 9 && !self.won?
  end

  def over?
    self.board.turn_count == 9 || self.draw? || self.won?
  end

  def winner
    cells = self.board.cells
    winner = nil
    p1_positions = cells.each_index.select{|i| cells[i] == "X"}
    p2_positions = cells.each_index.select{|i| cells[i] == "O"}
    WIN_COMBINATIONS.each do |combo|
      p1_win = combo - p1_positions
      p2_win = combo - p2_positions
      winner = self.player_1 if p1_win.empty?
      winner = self.player_2 if p2_win.empty?
    end
    winner
  end

  def start
  end

  def play
  end

  def turn
  end


end
