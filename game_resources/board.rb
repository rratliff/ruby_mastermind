#needs to store super-secret code.
#needs to take new input from player/guesser
#needs to receive results from codemaster

class Board
  attr_accessor :guesses, :feedback, :secret_code
  attr_reader   :winning_feedback

  @@feedback_opts = {"wrong_num":0, "right_num":1, "right_spot":2}




  def initialize
    @guesses = Hash.new
    @feedback = Hash.new
    @secret_code = Array.new
    @winning_feedback = Array.new
    4.times { @winning_feedback << @@feedback_opts[:right_spot] }
  end

  def number_of_guesses
    puts "this function will determine how big the board is. It will get a number forom the player and start a #times iterator to make the @guesses hash that long."
  end

  def feedback_opts
    @@feedback_opts
  end

  def draw_feedback(feedback_arr)
    feedback_arr.each_with_index do |item, ind|
      case item
      when 0 then feedback_arr[ind] = "O"
      when 1 then feedback_arr[ind] = "#"
      when 2 then feedback_arr[ind] = "!"
      end
    end
    feedback_arr = feedback_arr.sort.join
  end

  def draw_answer(answer_arr)
    answer_arr.join(" ")
  end

  def draw_blank_row(divider)
    puts divider
    puts "|         |      |"
  end

  def draw_board
    divider = "------------------"
    real_rows = @guesses.length
    num_blank_rows = 10 - real_rows
    num_blank_rows.times { draw_blank_row(divider) }

    counter = real_rows - 1
    real_rows.times do
      guess_arr = @guesses[counter.to_s]
      feedback_arr = @feedback[counter.to_s]
      puts divider
      puts "| #{draw_answer(guess_arr)} | #{draw_feedback(feedback_arr)} |"
      counter -= 1
    end

    puts divider

  end

end
