require_relative '../../lib/change_date/parser'

describe ChangeDate::Parser do
 describe '#parse' do
   context 'valid date string' do
     subject { described_class.new }

     let(:date_string) { '01/03/2010 23:00' }
     let(:parsed_data) { {
       year:   2010,
       month:     3,
       day:       1,
       hour:     23,
       minute:    0,
     } }

     it 'parses it correctly' do
       expect(subject.parse(date_string)).to eq parsed_data
     end
   end
 end
end
