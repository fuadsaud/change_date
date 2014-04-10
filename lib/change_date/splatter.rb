require_relative 'constants'

module ChangeDate
  class Splatter
    include Constants

    def splat(minutes)
      year, remaining_minutes = extract_year(minutes)
      days, remaining_minutes = extract_days(remaining_minutes)
      hour, remaining_minutes = extract_hour(remaining_minutes)

      month_number, month_range = find_month_for(day_of_the_year: days + 1)

      {
        year:   year + 1,
        month:  month_number,
        day:    days - month_range.first + 1,
        hour:   hour,
        minute: remaining_minutes,
      }
    end

    private

    def find_month_for(day_of_the_year:)
      MONTHS.find { |_i, range| range.cover?(day_of_the_year) }
    end

    def extract_year(minutes)
      minutes.divmod(MINUTES_IN_ONE_YEAR)
    end

    def extract_days(minutes)
      minutes.divmod(MINUTES_IN_ONE_DAY)
    end

    def extract_hour(minutes)
      minutes.divmod(MINUTES_IN_ONE_HOUR)
    end
  end
end

