module ChangeDate
  class Parser
    BadDateFormatError = Class.new(StandardError)

    MONTH_RANGE  = 1..12
    HOUR_RANGE   = 0..23
    MINUTE_RANGE = 0..59

    PATTERN =
      %r((?<day>\d{2})/(?<month>\d{2})/(?<year>\d{4}) (?<hour>\d{2}):(?<minute>\d{2}))

    def parse(date_string)
      match(date_string).tap do |date_parts|
        validate_date_parts!(date_parts)
      end
    end

    private

    def match(date_string)
      PATTERN.match(date_string) do |match|
        {
          year:   match[:year].to_i,
          month:  match[:month].to_i,
          day:    match[:day].to_i,
          hour:   match[:hour].to_i,
          minute: match[:minute].to_i,
        }
      end
    end

    def validate_date_parts!(year:, month:, day:, hour:, minute:)
      validate_year!(year) &&
        validate_month!(month) &&
        validate_day!(day, month: month) &&
        validate_hour!(hour) &&
        validate_minute!(minute)
    end

    def validate_day!(day, month:)
      fail BadDateFormatError unless ChangeDate::MONTHS[month].cover?(day)
    end

    def validate_month!(month)
      fail BadDateFormatError unless MONTH_RANGE.cover?(month)
    end

    def validate_year!(year)
      fail BadDateFormatError unless year > 0
    end

    def validate_hour!(hour)
      fail BadDateFormatError unless HOUR_RANGE.cover?(hour)
    end

    def validate_minute!(minute)
      fail BadDateFormatError unless MINUTE_RANGE.cover?(minute)
    end
  end
end
