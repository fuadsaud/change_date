require_relative '../../lib/change_date/validator'

describe ChangeDate::Validator do
  describe '#validate!' do
    subject { described_class.new }

    let(:date) { '01/03/2010 23:00' }
    let(:value) { 45 }

    context 'valid operator' do
      context '+' do
        let(:operator) { '+' }

        it 'does not fail' do
          expect {
            subject.validate!(date: date, operator: operator, value: value)
          }.to_not raise_error
        end
      end

      context '-' do
        let(:operator) { '+' }

        it 'does not fail' do
          expect {
            subject.validate!(date: date, operator: operator, value: value)
          }.to_not raise_error
        end
      end
    end

    context 'invalid operator' do
      let(:operator) { '*' }

      it 'fails the validation' do
        expect {
          subject.validate!(date: date, operator: operator, value: value)
        }.to raise_error ArgumentError
      end
    end
  end
end
