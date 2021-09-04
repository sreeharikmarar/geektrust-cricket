module Cricket
  class ScoreBoard
    attr_reader :target, :players, :team_name, :runs, :wickets, :wickets_in_hand, :overs, :balls_remaining, :required

    def initialize(name, players)
      @team_name = name
      @players = players
      @wickets_in_hand = @players.length - 1
      @runs = 0
      @wickets = 0
    end

    def set_target(total)
      @target = total
      @required = total
    end

    def set_overs(num_of_overs)
      @overs = num_of_overs
      @balls_remaining = 6
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

      @target -= runs if @target
      @runs += runs
      @balls_remaining -= 1
    end

    def update_overs
      @overs_left -= 1
    end

    def display
      puts "\n#{@team_name}:"
    end

    def display_coverage(ball)
      puts ball.summary
    end

    def wins?
      @target <= 0 if @target
    end

    def draw?
      (@target - 1 ) == 0 if @target
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
    end

    def team_summary
      puts "#{@team_name}:"
      @players.each do| player |
        puts "#{player.name} \t - #{player.runs}#{'*' if player.not_out? } \t(#{player.balls_faced} ball#{'s' if player.balls_faced > 1 }) \n" if player.status != "yet_to_bat"
      end
      puts "\n"
    end

    private

    def game_summary
      puts "\n"
      puts "-------------------------------"
      puts "         Game Summary          "
      puts "-------------------------------"
      if wins?
        puts "#{@team_name} won #{ 'with ' + @balls_remaining.to_s+ ' balls remaining' if @balls_remaining > 0} \n\n"
      elsif draw?
        puts "Match Drawn! \n\n"
      else 
        puts "#{@team_name} failed by #{@required - @runs} runs \n\n"
      end
    end
  end
end
