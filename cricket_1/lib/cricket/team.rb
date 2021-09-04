require 'yaml'

module Cricket
  class Team
    attr_reader :name, :players, :score_board
    attr_accessor :striker, :non_striker

    def initialize(name)
      @name = name
      initialize_team
    end

    def striker_play(ball)
      run = @striker.play(ball)
      update_score(ball, run)
    end

    def game_ends?
      @score_board.game_ends?
    end

    def player_gets_out?
      @striker.gets_out? && next_players.any?
    end

    def change_player
      change_striker if @striker.gets_out?
    end

    def change_striker
      @striker = next_players.first
      @striker.batting!
    end

    def set_target(runs)
      @score_board.set_target(runs + 1)
    end

    def set_runs(runs)
      @score_board.set_runs(runs)
    end

    def set_overs(num_of_overs)
      @score_board.set_overs(num_of_overs)
    end

    def update_overs
      @score_board.update_overs
      rotate_strikers
    end

    def update_score(ball, runs)
      @score_board.update(ball, runs, @striker)
      update_strike(runs)
      @score_board.display_coverage(ball)
    end

    def update_strike(runs)
      rotate_strikers if @striker.should_rotate?(runs)
      change_player if player_gets_out?
    end

    def total
      @score_board.runs
    end

    private

    def initialize_team
      initialize_players
      initialize_score_board
    end

    def initialize_players
      @players = get_players
      @striker, @non_striker = @players[0..1]
      @striker.batting!
      @non_striker.batting!
    end

    def get_players
      squad = Cricket::Squad.new(@name, YAML.load_file("#{Cricket.data}/yaml/team_squad.yml"))
      squad.players
    end

    def initialize_score_board
      @score_board = ScoreBoard.new(@name, @players)
    end

    def next_players
      @players.select { |player| player.yet_to_bat }
    end

    def rotate_strikers
      @striker, @non_striker = @non_striker, @striker
    end
  end
end
