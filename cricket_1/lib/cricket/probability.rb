require 'pickup'

module Cricket
  class Probability
    attr_reader :probability, :run

    def initialize(probability)
      @probability = Pickup.new(probability)
    end

    def run
      Cricket::Run.new(@probability.pick)
    end
  end
end
