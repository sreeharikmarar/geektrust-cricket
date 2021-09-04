require_relative 'cricket'

batting_team = Cricket::Team.new("Enchai")
bowling_team = Cricket::Team.new("Lengaburu")

game = Cricket::Game.new(4, batting_team, bowling_team)

game.start(39)
game.end
