module Cricket
  class Ball
    attr_reader :number, :over_number, :runs, :out, :summary

    def initialize(over_number, number)
      @over_number = over_number
      @number = number
    end

    def set_runs(run)
      out! if run.is_out?
      @runs = run.is_out? ? 0 : run.value
    end

    def out!
      @out = true
    end

    def out?
      @out != nil
    end

    def update_summary(player)
      @summary = out? ? 
      "#{@over_number}.#{@number} #{player} is OUT!" : 
      "#{@over_number}.#{@number} #{player} scores #{@runs} runs"
    end
  end
end
