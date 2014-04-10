require_relative 'constants'

module ChangeDate
  class Parser
    include Constants

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
      ensure! {
        PATTERN.match(date_string) do |match|
          {
            year:   match[:year].to_i,
            month:  match[:month].to_i,
            day:    match[:day].to_i,
            hour:   match[:hour].to_i,
            minute: match[:minute].to_i,
          }
        end
      }
    end

    def validate_date_parts!(year:, month:, day:, hour:, minute:)
      validate_year!(year) &&
        validate_month!(month) &&
        validate_day!(day, month: month) &&
        validate_hour!(hour) &&
        validate_minute!(minute)
    end

    def validate_year!(year)
      ensure! { year > 0 }
    end

    def validate_month!(month)
      ensure! { MONTH_RANGE.cover?(month) }
    end

    def validate_day!(day, month:)
    ensure! {
      range = MONTHS[month]

      range.cover?(range.first + day - 1)
    }
    end

    def validate_hour!(hour)
      ensure! { HOUR_RANGE.cover?(hour) }
    end

    def validate_minute!(minute)
      ensure! { MINUTE_RANGE.cover?(minute) }
    end

    def ensure!(&block)
      block.call or fail BadDateFormatError
    end
  end
end
