require_relative '../../lib/change_date/reducer'

describe ChangeDate::Reducer do
  describe '#reduce' do
    subject { described_class.new }

    let(:date) { {
      year:   2010,
      month:     3,
      day:       1,
      hour:     23,
      minute:    0,
    } }

    let(:minutes) { 1_056_016_740 }

    it 'reduces the date to a minutes count' do
      expect(subject.reduce(date)).to eq minutes
    end
  end
end
