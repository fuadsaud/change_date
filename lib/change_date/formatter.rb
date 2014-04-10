module ChangeDate
  class Formatter
    TEMPLATE = '%02d/%02d/%04d %02d:%02d'

    def format(year:, month:, day:, hour:, minute:)
      sprintf TEMPLATE, day, month, year, hour, minute
    end
  end
end
