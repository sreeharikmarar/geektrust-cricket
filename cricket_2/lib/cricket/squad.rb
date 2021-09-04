module Cricket
  class Squad
    attr_reader :name, :info, :players

    def initialize(name, info = {})
      @name = get_squad_name(name)
      @info = info
      initialize_players_with_probability
    end

    private

    def initialize_players_with_probability
      @players = []
      proc = proc { |player_name| @players << get_player(player_name) }
      @info[@name]['players'].keys.each(&proc) unless @info[@name].nil?
    end

    def get_squad_name(name)
      name.downcase.split(' ').join('_')
    end

    def get_player_name(player)
      player.split('_').map(&:capitalize).join(' ')
    end

    def get_player(player_name)
      player = Cricket::Player.new(get_player_name(player_name))
      player.probability = Cricket::Probability.new(@info[@name]['players'][player_name])
      player
    end
  end
end
