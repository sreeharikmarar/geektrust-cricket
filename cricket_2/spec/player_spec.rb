RSpec.describe Cricket::Player do
  context 'initialize' do
    it 'should initialize a player' do
      player = Cricket::Player.new('player_1')
      expect(player.name).to eq('player_1')
      expect(player.status).to eq(Cricket::Status::YET_TO_BAT)
      expect(player.runs).to eq(0)
      expect(player.balls_faced).to eq(0)
    end
  end

  context '#play_a_ball' do
    it 'player should score runs based on their probablity' do
      player = Cricket::Player.new('player_1')
      allow(player.probability).to receive(:run).and_return(Cricket::Run.new(4))

      ball = Cricket::Ball.new(0, 1)
      player.play(ball)

      expect(player.runs).to eq(4)
      expect(player.balls_faced).to eq(1)
    end

    it 'player should gets out if probability returns -1' do
      player = Cricket::Player.new('player_1')
      allow(player.probability).to receive(:run).and_return(Cricket::Run.new(-1))

      ball = Cricket::Ball.new(0, 1)
      player.play(ball)

      expect(player.runs).to eq(0)
      expect(player.balls_faced).to eq(1)
      expect(player.status).to eq(Cricket::Status::OUT)
    end
  end

  context '#rotate_strike' do
    let(:player) { Cricket::Player.new('player_1') }

    it 'player should rotate strike if the runs scored is 1,3,5' do
      expect(player.should_rotate?(Cricket::Run.new(1))).to eq true
      expect(player.should_rotate?(Cricket::Run.new(3))).to eq true
      expect(player.should_rotate?(Cricket::Run.new(5))).to eq true
    end

    it 'player should not rotate strike if the runs scored is not equal to 1,3 & 5' do
      expect(player.should_rotate?(Cricket::Run.new(2))).to eq false
    end
  end

  context "#change_player_status" do
    let(:player) { Cricket::Player.new('player_1') }

    it "should set player status as yet_to_bat on initialization" do
      expect(player.status).to eq(Cricket::Status::YET_TO_BAT)
    end

    it "should set player status as batting while playing" do
      player.batting!
      expect(player.status).to eq(Cricket::Status::BATTING)
    end

    it "should set player status as out when gets out" do
      player.out!
      expect(player.gets_out?).to eq(true)
      expect(player.status).to eq(Cricket::Status::OUT)
    end
  end
end
