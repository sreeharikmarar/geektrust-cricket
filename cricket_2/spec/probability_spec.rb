RSpec.describe Cricket::Probability do
  context '#initialize' do
    it 'should initialize probability based on each player' do
      info = { 1 => 5 }
      probability = Cricket::Probability.new(info)
      expect(probability.run.value).to eq(1)
    end
  end
end