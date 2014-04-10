require_relative 'constants'

module ChangeDate
  class Splatter
    include Constants

    def splat(minutes)
      remaining_minutes = minutes

      year, remaining_minutes = remaining_minutes.divmod(MINUTES_IN_ONE_YEAR)
      days, remaining_minutes = remaining_minutes.divmod(MINUTES_IN_ONE_DAY)
      hour, remaining_minutes = remaining_minutes.divmod(MINUTES_IN_ONE_HOUR)

      month_number, month_range = find_month_for(day_of_the_year: days + 2)

      {
        year:   year + 1,
        month:  month_number,
        day:    days - month_range.first + 2,
        hour:   hour,
        minute: remaining_minutes,
      }
    end

    private

    def find_month_for(day_of_the_year:)
      MONTHS.find { |_i, range| range.cover?(day_of_the_year) }
    end
  end
end

