RSpec.describe Cricket::Team do
  context '#initialize' do
    let(:team) { Cricket::Team.new('lengaburu') }
    
    it 'should initialize team with name' do
      expect(team.name).to eq('lengaburu')
    end

    it 'should arrange players while initializing team' do
      expect(team.players).not_to be_nil
    end

    it 'should set striker and non striker while arranging players' do
      expect(team.striker.name).to eq("Kirat Boli")
      expect(team.non_striker.name).to eq("Ns Nodhi")
    end
  end

  context "#striker_plays_a_ball" do
    before :each do
      @team = Cricket::Team.new('lengaburu')
      @team.set_overs(1)
    end
    
    it "should update scoreboard if striker score runs" do
      allow(@team.striker.probability).to receive(:run).and_return(Cricket::Run.new(4))
      ball = Cricket::Ball.new(0, 1)

      @team.striker_play(ball)

      expect(@team.striker.runs).to eq(4)
      expect(@team.score_board.runs).to eq(4)
    end

    it "should rotate striker based on runs scored" do
      allow(@team.striker.probability).to receive(:run).and_return(Cricket::Run.new(1))
      ball = Cricket::Ball.new(0, 1)

      @team.striker_play(ball)

      expect(@team.striker.name).to eq("Ns Nodhi")
      expect(@team.non_striker.name).to eq("Kirat Boli")
    end
  end

context "#team_wins_or_loss" do
    before :each do
      @team = Cricket::Team.new('lengaburu')
      @team.set_target(5)
      @team.set_overs(1)
    end

    it "should end the game if the team score more than target score" do
      allow(@team.striker.probability).to receive(:run).and_return(Cricket::Run.new(6))
      ball = Cricket::Ball.new(0, 1)

      @team.striker_play(ball)

      expect(@team.game_ends?).to be_truthy
      expect(@team.score_board.wins?).to be_truthy
      expect(@team.score_board.runs).to eq(6)
    end

    it "should end the game if all players gets out before scoring target" do
      allow(@team.striker.probability).to receive(:run).and_return(Cricket::Run.new(-1))
      allow(@team.score_board).to receive(:all_out?).and_return(true)      
      
      expect(@team.game_ends?).to be_truthy
    end

    it "should end the game if team couldnt score target on desired over" do
      allow(@team.striker.probability).to receive(:run).and_return(Cricket::Run.new(-1))
      allow(@team.score_board).to receive(:over_ends?).and_return(true)      
      
      expect(@team.game_ends?).to be_truthy
    end

    it "should end the game if team couldnt score target on desired over" do
      allow(@team.striker.probability).to receive(:run).and_return(Cricket::Run.new(-1))
      allow(@team.score_board).to receive(:over_ends?).and_return(true)      

      expect(@team.game_ends?).to be_truthy
    end
  end
end