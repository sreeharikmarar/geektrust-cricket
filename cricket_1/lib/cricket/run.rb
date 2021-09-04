module Cricket
  class Run
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def is_out?
      @value == -1
    end

    def is_odd?
      [1, 3, 5].include?(@value)
    end

    def is_countable?
      @value >= 0
    end
  end
end
