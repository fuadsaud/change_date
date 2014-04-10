require_relative '../../lib/change_date/validator'

describe ChangeDate::Validator do
 describe '#validate!' do
   context 'invalid operator' do
     subject { described_class.new }

     let(:date) { '01/03/2010 23:00' }
     let(:operator) { '*' }
     let(:value) { 45 }

     it 'fails the validation' do
       expect {
         subject.validate!(date: date, operator: operator, value: value)
       }.to raise_error ArgumentError
     end
   end
 end
end
