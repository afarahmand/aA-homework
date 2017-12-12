class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new(14){[:stone, :stone, :stone, :stone]} # cups 6 and 13 are ends
    @cups[6] = []
    @cups[13] = []
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > 13
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    start_pos-=1 if start_pos < 7 && start_pos > 0
    number_of_stones_to_place = @cups[start_pos].length
    @cups[start_pos] = []
    last_cup = start_pos

    if current_player_name == @name1
      while number_of_stones_to_place > 0
        if last_cup == 12
          last_cup = 0
        else
          last_cup+=1
        end

        @cups[last_cup].push(:stone)
        number_of_stones_to_place-=1
      end

      render

      return next_turn(last_cup)
    else # Player 2
      while number_of_stones_to_place > 0
        if last_cup == 13
          last_cup = 0
        elsif last_cup == 5
          last_cup = 7
        else
          last_cup+=1
        end

        @cups[last_cup].push(:stone)
        number_of_stones_to_place-=1
      end

      render

      return next_turn(last_cup)
    end
  end

  def next_turn(ending_cup_idx)
    #p "Index: #{ending_cup_idx}"
    #p "Length: #{@cups[ending_cup_idx].length}"
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    elsif @cups[ending_cup_idx].length > 1
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
    return true if @cups[0..5].all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
    false
  end

  def winner
    winner = @cups[6] <=> @cups[13]

    if winner == -1
      return @name2
    elsif winner == 1
      return @name1
    else
      return :draw
    end
  end
end
