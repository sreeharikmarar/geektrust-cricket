RSpec.describe Cricket::Over do
  context '#initialize' do
    it 'should initialize over' do
      over = Cricket::Over.new(1)
      expect(over.number).to eq(1)
      expect(over.max_balls).to eq(6)
    end
  end
end
