RSpec.describe Cricket::Squad do
  context '#Initialize' do
    it 'should initialize a squad with name' do
      info = {}
      squad = Cricket::Squad.new('team_a', info)
      expect(squad.name).to eq('team_a')
    end

    it 'should capitalize player names while initializing' do
      info = { 'team_a' => { 'players' => { 'player_a' => { 1 => 5 } } } }
      squad = Cricket::Squad.new('team_a', info)
      expect(squad.players.first.name).to eq('Player A')
    end

    it 'should initialize players with probability' do
      info = { 'team_a' => { 'players' => { 'player_a' => { 0 => 5 } } } }
      squad = Cricket::Squad.new('team_a', info)
      expect(squad.players.first.probability).not_to be_nil
    end

    it 'should initialize players with probability of scoring runs in each ball' do
      info = { 'team_a' => { 'players' => { 'player_a' => { 1 => 5 } } } }
      squad = Cricket::Squad.new('team_a', info)
      expect(squad.players.first.probability.run.value).to eq(1)
    end
  end
end
