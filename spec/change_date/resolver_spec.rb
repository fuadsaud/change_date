require_relative '../../lib/change_date/resolver'

describe ChangeDate::Resolver do
  describe '#resolver' do
    subject { described_class.new }

    let(:base) { 1_056_016_740 }
    let(:minutes) { 4000 }

    context 'adding minutes' do
      let(:result) { base + minutes }
      let(:operator) { '+' }

      it 'adds the given amount of minutes' do
        expect(
          subject.resolve(
            base: base, operator: operator, value: minutes)).to eq result
      end
    end

    context 'subtracting minutes' do
      context 'base amount of minutes is large enough' do
        let(:result) { base - minutes }
        let(:operator) { '-' }

        it 'subtracts the given amount of minutes' do
          expect(
            subject.resolve(
              base: base, operator: operator, value: minutes)).to eq result
        end
      end

      context 'base amount of minutes is not large enough' do
        let(:base) { 4000 }
        let(:minutes) { 1_056_016_740 }
        let(:result) { base - minutes }
        let(:operator) { '-' }

        it 'fails' do
          expect {
            subject.resolve(base: base, operator: operator, value: minutes)
          }.to raise_error ArgumentError
        end
      end
    end
  end
end
