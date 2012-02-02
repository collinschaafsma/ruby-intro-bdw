require "base"

class Simple < Base

  LYRIC = "They got money for wars, but can't feed the poor"

  def in_2pac_lyric?(term)
    LYRIC.include? term
  end

  def talk_to_me
    if block_given?
      #im gonna do something then yield
      yield
    else
      puts "no block for you"
    end
  end

  class << self

    def big_array
      Array(1..1000)
    end

    def add_it_all_up(*args)
      args.inject(:+)
    end

    def add_two_numbers(number1, number2)
      number1.to_i + number2.to_i
    end

    def fibonacci_sequence(sequence_count=10)
      sequences = []
      current_sequence = 0
      next_sequence    = 1

      sequence_count.times do
        sequences << current_sequence
        current_sequence, next_sequence = next_sequence, current_sequence + next_sequence
      end

      sequences
    end

  end

end
