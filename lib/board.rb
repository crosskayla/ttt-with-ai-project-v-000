class Board
  
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def reset!
    self.cells = Array.new(9," ")
  end
  
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  
  def position(input)
    index = input_to_index(input)
    self.cells[index]
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def update(input, player_obj)
    index = input_to_index(input)
    self.cells[index] = player_obj.token if valid_move?(input)
  end
  
  def full?
    self.cells.none?{|cell| cell == " "}
  end
  
  def turn_count
    self.cells.find_all{|cell| cell != " "}.count
  end
  
  def taken?(input)
    position(input) != " "
  end
  
  def valid_move?(input)
    !taken?(input) if input.to_i.between?(1,9)
  end
  
end
