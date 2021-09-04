RSpec.describe Cricket::Run do
  context '#Initialize' do
    it 'should initialize run with a value' do
      run = Cricket::Run.new(3)
      expect(run.value).to eq(3)
    end
  end

  context '#Is out' do
    it 'should set as out if runs scored is -1' do
      run = Cricket::Run.new(-1)
      expect(run.is_out?).to be true
    end
  end

  context '#Is countable' do
    it 'should check if runs scored is valid countable value' do
      run = Cricket::Run.new(-1)
      expect(run.is_out?).to be true
    end
  end

  context '#Is odd' do
    it 'should check if the players should rotate strike based on the runs scored' do
      run = Cricket::Run.new(3)
      expect(run.is_odd?).to be true
    end
  end
end
