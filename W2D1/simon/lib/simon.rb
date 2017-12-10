require "byebug"

class Simon
  COLORS = %w(red blue green yellow)
  COLOR_SCUTS = {"R"=>"red", "B"=>"blue", "G"=>"green", "Y"=>"yellow"}

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over

    game_over_message
    #sleep(3)
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message
      @sequence_length+=1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      print "#{color} "
      sleep(1)
    end

    system("clear")
  end

  def require_sequence
    new_seq = []

    while new_seq == @seq[0...new_seq.length] && new_seq.length != @sequence_length
      print "Enter the next color of the sequence (R, B, G, Y): "
      input = gets.chomp
      new_seq << COLOR_SCUTS[input]
    end

    if new_seq.length != @sequence_length
      @game_over = true
    end
  end

  def add_random_color
    @seq.push(COLORS[rand(COLORS.length)])
  end

  def round_success_message
    puts "You completed the last round!"
  end

  def game_over_message
    puts "You lose.  Game over..."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    #play
  end
end

#undo the comments below and the ones in the class definition to play the game
#game = Simon.new
#game.play
