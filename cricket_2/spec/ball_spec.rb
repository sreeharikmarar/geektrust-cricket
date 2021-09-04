RSpec.describe Cricket::Ball do
  context '#initialize' do
    it 'should initialize ball with over number and ball number' do
      ball = Cricket::Ball.new(2,1)

      expect(ball.over_number).to eq(2)
      expect(ball.number).to eq(1)
    end
  end

  context "#set runs on ball" do 
    let (:ball) { Cricket::Ball.new(1,1) }

    it 'should set runs on ball object while playing' do
      ball.set_runs(Cricket::Run.new(4))
      expect(ball.runs).to eq(4)
    end

    it "should set as out if runs scored is less than zero" do
      ball.set_runs(Cricket::Run.new(-1))
      expect(ball.out?).to eq(true)
    end

    it "should set as runs as zero if out" do
      ball.set_runs(Cricket::Run.new(-1))
      expect(ball.runs).to eq(0)
    end
  end

  context "#set summary on ball" do
    let (:ball) { Cricket::Ball.new(1,1) }

    it 'summary should contain ball number over number player and the runs scrored' do
      ball.set_runs(Cricket::Run.new(4))
      ball.update_summary("Player_1")
      expect(ball.summary).to eq("1.1 Player_1 scores 4 runs")
    end

    it 'summary should contain ball number over number player if gets out' do
      ball.set_runs(Cricket::Run.new(-1))
      ball.update_summary("Player_1")
      expect(ball.summary).to eq("1.1 Player_1 is OUT!")
    end
  end
end