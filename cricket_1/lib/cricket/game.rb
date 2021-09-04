module Cricket
  class Game
    attr_reader :num_of_overs, :batting_team, :bowling_team 

    def initialize(num_of_overs, batting_team, bowling_team)
      @num_of_overs = num_of_overs
      @batting_team = batting_team
      @bowling_team = bowling_team
    end

    def start(runs)
      start_first_session(runs)
      session_break
      start_second_session
    end

    def end
      @batting_team.score_board.display_summary
    end

    private

    def start_first_session(runs)
      @batting_team.set_runs(runs)
    end

    def session_break
      @batting_team, @bowling_team = @bowling_team, @batting_team
      @batting_team.set_target(@bowling_team.total)
    end

    def start_second_session(num_of_overs = @num_of_overs)
      @batting_team.set_overs(num_of_overs)
      start_session
    end

    def start_session
      team = @batting_team
      current_over = 0

      until team.game_ends?
        over = Over.new(current_over)
        over.start(team)
        1.upto(over.max_balls) do |ball_number|
          ball = Ball.new(over.number, ball_number)
          team.striker_play(ball)
          return if team.game_ends?
        end
        over.end(team)

        current_over += 1
      end
    end
  end
end
