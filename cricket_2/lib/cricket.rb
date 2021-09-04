require_relative 'cricket/ball'
require_relative 'cricket/player'
require_relative 'cricket/status'
require_relative 'cricket/team'
require_relative 'cricket/squad'
require_relative 'cricket/run'
require_relative 'cricket/game'
require_relative 'cricket/probability'
require_relative 'cricket/score_board'
require 'pry'

module Cricket
  def self.root
    File.dirname __dir__
  end

  def self.data
    File.join root, 'data'
  end
end
