class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1, game_over = false, seq = [])
    @sequence_length = sequence_length
    @game_over = game_over
    @seq = seq
    @player_sequence = []
  end

  def play
    take_turn until @game_over == true
    puts game_over_message
    reset_game
  end

  def take_turn
    puts "Here is the sequence."
    show_sequence
    sleep(3)
    system('clear')
    puts "Follow the sequence"
    require_sequence
    if @player_sequence == @seq
      puts round_success_message
      @player_sequence = []
      @sequence_length += 1
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    puts @seq
  end

  def require_sequence
    i = 0
    until @player_sequence.length == @sequence_length
      answer = gets.chomp
      if !COLORS.include?(answer)
        puts "Write a valid color"
        i -= 1
      elsif answer != @seq[i]
        break
      else
        @player_sequence << answer
      end
      i += 1
    end
    @player_sequence
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "You passed this round! Next round!"
  end

  def game_over_message
    "You lost. Game is over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    @player_sequence = []
  end
end
