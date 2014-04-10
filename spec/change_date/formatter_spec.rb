require_relative '../../lib/change_date/formatter'

describe ChangeDate::Formatter do
  describe '#format' do
    subject { described_class.new }

    let(:date) { {
      year:   2010,
      month:     3,
      day:       1,
      hour:     23,
      minute:    0,
    } }

    it 'it formats given date parts' do
      expect(subject.format(date)).to eq '01/03/2010 23:00'
    end
  end
end
