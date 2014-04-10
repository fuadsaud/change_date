require_relative '../../lib/change_date/splatter'

describe ChangeDate::Splatter do
  describe 'splat' do
    subject { described_class.new }

    let(:minutes) { 1_056_016_740 }

    let(:date) { {
      year:   2010,
      month:     3,
      day:       1,
      hour:     23,
      minute:    0,
    } }

    it 'returns a date when inputted an amount' do
      expect(subject.splat(minutes)).to eq date
    end
  end
end
