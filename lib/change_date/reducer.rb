require_relative 'constants'

module ChangeDate
  class Reducer
    include Constants

    def reduce(year:, month:, day:, hour:, minute:)
      years_to_minutes(year) +
        days_to_minutes(days: day, month: month) +
        hours_to_minutes(hour) +
        minute
    end

    private

    def years_to_minutes(years)
      (years - 1) * MINUTES_IN_ONE_YEAR
    end

    def days_to_minutes(month:, days:)
      day_of_the_year(month: month, day: days) * MINUTES_IN_ONE_DAY
    end

    def hours_to_minutes(hours)
      hours * MINUTES_IN_ONE_HOUR
    end

    def day_of_the_year(month:, day:)
      MONTHS[month].first + day - 1
    end
  end
end
