class Simon
  COLORS = %w(red blue green yellow)
  MESSAGES = ["Nice!", "Good job!", "Not bad!", "Way to go!"]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    system("clear")

    show_sequence
    require_sequence

    unless game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(0.25)
      system("clear")
    end
    
  end

  def require_sequence
    puts "Repeat the sequence."

    seq.length.times do |i|
      input = gets.chomp
      if input != seq[i]
        self.game_over = true
        return
      end
    end

    # input = gets.chomp.split

    # self.game_over = true if input != seq

  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts MESSAGES.sample
    sleep(3)
  end

  def game_over_message
    puts "You lose!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  s = Simon.new
  s.play
end