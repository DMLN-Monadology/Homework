require_relative "player"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = make_cups
    @player1 = Player.new(name1,1)
    @player2 = Player.new(name2,2)

  end

  def make_cups
    cups = Array.new(14) {Array.new}
    cups.each_with_index do |ele, idx|
      if idx == 6 || idx == 13
        next
      else cups[idx] = [:stone, :stone, :stone, :stone]
      end
    end
    cups
  end


  def place_stones
    #
  end

  def valid_move?(start_pos)
    if !((1..6).to_a + (7..12).to_a).include?(start_pos)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].count
    @cups[start_pos] = []
    position = start_pos + 1
    if current_player_name = @player1.name
      skip = 13
    else skip = 6
    end
    while stones > 0
      if position > 13
        position = 0
      end
      if position != skip
        stones -= 1
        @cups[position] << :stone
      end
      position += 1
    end
    render
    ending_pos = position - 1

    next_turn(ending_pos, current_player_name)
  end

  def next_turn(ending_pos, current_player_name)
    if current_player_name == @player1.name
      current_player = @player1
      score_box = 6
    else
      current_player = @player2
      score_box = 13
    end
    if ending_pos == -1
      ending_pos = 13
    end
    if ending_pos == score_box
      return :switch
    end
    if @cups[ending_pos].count == 1
      return :prompt
    end
    if @cups[ending_pos].count > 1
      return ending_pos
    end

  end


  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    (@cups[0..5] + @cups[7..12]).all? {|cup| cup == []}
  end

  def winner
    if @cups[6].count == @cups[13].count
      return :draw
    end
    if @cups[6].count > @cups[13].count
      return @player1.name
    else return @player2.name
    end
  end
end
