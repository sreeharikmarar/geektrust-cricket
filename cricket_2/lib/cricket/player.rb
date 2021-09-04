module Cricket
  class Player
    attr_reader :name, :status, :runs, :balls_faced
    attr_accessor :probability

    def initialize(name)
      @name = name
      @status = Cricket::Status::YET_TO_BAT
      @runs = 0
      @balls_faced = 0
    end

    def play(ball)
      run = @probability.run
      update_score(run)
      run
    end

    def update_score(run)
      @balls_faced += 1
      @runs += run.value if run.is_countable?
      out! if run.is_out?
    end

    def out!
      @status = Cricket::Status::OUT
    end

    def batting!
      @status = Cricket::Status::BATTING
    end

    def not_out?
      @status == Status::BATTING
    end

    def gets_out?
      @status == Status::OUT
    end

    def yet_to_bat
      @status == Status::YET_TO_BAT
    end

    def should_rotate?(run)
      run.is_odd?
    end
  end
end
