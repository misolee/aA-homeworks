require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = (Array.new(14) {Array.new()})
    place_stones
  end

  def place_stones
    @cups.each_with_index do |el, i|
      4.times {el << :stone} unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    current_pos = start_pos + 1

    until stones.empty?

      if current_pos > 13
        current_pos = 0
      end

      if current_player_name == @name1
        @cups[current_pos] << stones.pop unless current_pos == 13
      else
        @cups[current_pos] << stones.pop unless current_pos == 6
      end
      current_pos += 1
    end
    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count > 0
      :switch
    else
      ending_cup_idx
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
    @cups[0..5].each do |arr|
      return true if arr.all? {|subarr| subarr == []}
    end
    @cups[7..12].each do |arr|
      return true if arr.all? {|subarr| subarr == []}
    end
    false
  end

  def winner
    return :draw if @cups[6] == @cups[13]
    return "#{@name1}" if @cups[6].count > @cups[13].count
    return "#{@name2}" if @cups[13].count > @cups[6].count
  end
end
