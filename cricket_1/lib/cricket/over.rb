module Cricket
  class Over
    MAX_NUM_OF_BALLS = 6
    attr_reader :number, :max_balls

    def initialize(number)
      @number = number
      @max_balls = MAX_NUM_OF_BALLS
    end

    def start(team)
      team.score_board.display_target 
    end

    def end(team)
      team.update_overs
    end
  end
end
