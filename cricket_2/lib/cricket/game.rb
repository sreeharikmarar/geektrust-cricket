module Cricket
  class Game
    attr_reader :num_of_overs, :batting_team, :bowling_team 

    def initialize(num_of_overs, batting_team, bowling_team)
      @num_of_overs = num_of_overs
      @batting_team = batting_team
      @bowling_team = bowling_team
    end

    def start
      start_first_session
      session_break
      start_second_session
    end

    def end
      @batting_team.score_board.display_summary

      @bowling_team.score_board.team_summary
      @batting_team.score_board.team_summary
    end

    private

    def start_first_session(num_of_overs = @num_of_overs)
      @batting_team.set_overs(num_of_overs)
      start_session
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
      team.score_board.display

      6.times do |ball_number|
        ball = Ball.new(0, ball_number+1)
        team.striker_play(ball)
        return if team.game_ends?
      end
    end

  end
end
