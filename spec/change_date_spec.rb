require_relative '../lib/change_date'

shared_examples 'changing dates' do
  it 'changes the date correctly' do
    expect(subject.change_date(base_date, op, minutes)).to eq final_date
  end

  context 'using negative amount of minutes' do
    it 'uses the absolute value' do
    expect(subject.change_date(base_date, op, -minutes)).to eq final_date
    end
  end
end

describe ChangeDate do
  describe '.change_date' do
    subject { described_class }

    let(:base_date) { '01/03/2010 23:00' }
    let(:minutes) { 1234 }

    it 'fails when given a bad operator' do
      expect {
        subject.change_date(base_date, '*', minutes)
      }.to raise_error ArgumentError
    end

    context 'adding minutes to a date' do
      let(:op) { '+' }

      context 'small amount of minutes' do
        let(:minutes) { 4000 }
        let(:base_date) { '01/03/2010 23:00' }
        let(:final_date) { '04/03/2010 17:40' }

        it_behaves_like 'changing dates'
      end

      context 'large amount of minutes' do
        let(:minutes) { ChangeDate::Constants::MINUTES_IN_ONE_YEAR }
        let(:base_date) { '01/01/2014 17:40' }
        let(:final_date) { '01/01/2015 17:40' }

        it_behaves_like 'changing dates'

        context 'may 1st' do
          let(:minutes) { ChangeDate::Constants::MINUTES_IN_ONE_YEAR }
          let(:base_date) { '01/03/2010 23:00' }
          let(:final_date) { '01/03/2011 23:00' }

          it_behaves_like 'changing dates'
        end
      end
    end

    context 'subtracting minutes from a date' do
      let(:op) { '-' }

      context 'small amount of minutes' do
        let(:minutes) { 4000 }
        let(:base_date) { '04/03/2010 17:40' }
        let(:final_date) { '01/03/2010 23:00' }

        it_behaves_like 'changing dates'
      end

      context 'large amount of minutes' do
        let(:op) { '-' }
        let(:minutes) { ChangeDate::Constants::MINUTES_IN_ONE_YEAR }
        let(:base_date) { '01/03/2010 23:00' }
        let(:final_date) { '01/03/2009 23:00' }

        it_behaves_like 'changing dates'
      end
    end
  end
end
