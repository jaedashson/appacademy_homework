require "set"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each do |i|
      4.times { self.cups[i] << :stone }
    end

    (7..12).each do |i|
      4.times { self.cups[i] << :stone }
    end

  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, 13)

    raise "Starting cup is empty" if self.cups[start_pos].empty?

    true
  end

  def make_move(start_pos, current_player_name)
    store = ( current_player_name == @name1 ? 6 : 13 )
    opponent_store = ( current_player_name == @name1 ? 13 : 6 )

    hand = []

    until self.cups[start_pos].empty?
      hand << self.cups[start_pos].pop
    end

    pos = start_pos

    until hand.empty?
      pos = (pos + 1) % 14
      self.cups[pos] << hand.pop unless pos == opponent_store
    end

    self.render
    
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif self.cups[ending_cup_idx].length == 1
      return :switch
    elsif self.cups[ending_cup_idx].length > 1
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).to_a.all? { |i| @cups[i].empty? } || (7..12).to_a.all? { |i| @cups[i].empty? }
  end

  def winner
    case @cups[6].length <=> @cups[13].length
    when 1
      @name1
    when -1
      @name2
    when 0
      :draw
    end
  end
end
