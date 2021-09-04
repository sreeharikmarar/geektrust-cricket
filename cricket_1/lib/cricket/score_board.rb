module Cricket
  class ScoreBoard
    attr_reader :target, :players, :team_name, :runs, :wickets, :wickets_in_hand, :overs, :overs_left

    def initialize(name, players)
      @team_name = name
      @players = players
      @wickets_in_hand = @players.length - 1
      @target = 0
      @runs = 0
      @wickets = 0
    end

    def set_target(target)
      @target = target
    end

    def set_overs(num_of_overs)
      @overs = @overs_left = num_of_overs
    end

    def set_runs(runs)
      @runs = runs
    end

    def update(ball, run, striker)
      ball.set_runs(run)
      ball.update_summary(striker.name)

      update_score(run.value)
    end

    def update_score(runs)
      if runs < 0
        @wickets += 1
        @wickets_in_hand -= 1
        return
      end

      @target -= runs
      @runs += runs
    end

    def update_overs
      @overs_left -= 1
    end

    def display_target
      puts "\n#{@team_name} requires #{@target} runs in #{@overs_left} overs \n\n"
    end

    def display_coverage(ball)
      puts ball.summary
    end

    def wins?
      @target <= 0
    end

    def draw?
      (@target - 1 ) == 0
    end

    def over_ends?
      @overs_left == 0
    end

    def all_out?
      @wickets_in_hand == 0
    end

    def game_ends?
      wins? || all_out? || over_ends?
    end

    def display_summary
      game_summary
      team_summary
    end

    private

    def game_summary
      puts "\n"
      puts "-------------------------------"
      puts "         Game Summary          "
      puts "-------------------------------"
      if wins?
        puts "#{@team_name} won by #{@wickets_in_hand} wickets \n\n"
      elsif draw?
        puts "Match Drawn! \n\n"
      else
        puts "#{@team_name} failed by #{@target} runs \n\n"
      end
    end

    def team_summary
      @players.each do| player |
        puts "#{player.name} \t - #{player.runs}#{'*' if player.not_out? } \t(#{player.balls_faced} ball#{'s' if player.balls_faced > 1 }) \n" if player.status != "yet_to_bat"
      end
    end
  end
end
