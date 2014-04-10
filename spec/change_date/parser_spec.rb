require_relative '../../lib/change_date/parser'

shared_examples 'failing' do
  it 'it fails the parsing' do
    expect {
      subject.parse(date_string)
    }.to raise_error ChangeDate::Parser::BadDateFormatError
  end
end

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

   context 'invalid date string' do
     context 'invalid year' do
       let(:date_string) { '01/03/000 23:00' }

       it_behaves_like 'failing'
     end

     context 'invalid month' do
       let(:date_string) { '01/65/2010 23:00' }

       it_behaves_like 'failing'
     end

     context 'invalid day' do
       let(:date_string) { '51/03/2010 23:00' }

       it_behaves_like 'failing'
     end

     context 'invalid hour' do
       let(:date_string) { '15/03/2010 45:00' }

       it_behaves_like 'failing'
     end

     context 'invalid minute' do
       let(:date_string) { '15/03/2010 23:656' }

       it_behaves_like 'failing'
     end

     context 'missing part' do
       let(:date_string) { '15/2010 23:16' }

       it_behaves_like 'failing'
     end
   end
 end
end
