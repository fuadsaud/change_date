module ChangeDate
  class Formatter
    def format(year:, month:, day:, hour:, minute:)
      sprintf '%02d/%02d/%04d %02d:%02d', day, month, year, hour, minute
    end
  end
end
