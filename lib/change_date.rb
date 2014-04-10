require_relative './change_date/validator'
require_relative './change_date/parser'
require_relative './change_date/resolver'
require_relative './change_date/formatter'
require_relative './change_date/reducer'
require_relative './change_date/splatter'

module ChangeDate
  class << self
    def change_date(date, op, value)
      with_valid_args(date: date, operator: op, value: value) do |date, op, value|
        format(
          splat(
            resolve(
              base: reduce(parse(date)),
              operator: op,
              value: value)))
      end
    end

    private

    def reduce(year:, month:, day:, hour:, minute:)
      reducer
        .reduce(year: year, month: month, day: day, hour: hour, minute: minute)
    end

    def resolve(base:, operator:, value:)
      resolver.resolve(base: base, operator: operator, value: value)
    end

    def splat(minutes)
      splatter.splat(minutes)
    end

    def with_valid_args(date:, operator:, value:)
      validator.validate!(date: date, operator: operator, value: value.abs)

      yield date, operator, value.abs
    end

    def parse(date_string)
      parser.parse(date_string)
    end

    def format(year:, month:, day:, hour:, minute:)
      formatter
        .format(year: year, month: month, day: day, hour: hour, minute: minute)
    end

    def validator
      Validator.new
    end

    def parser
      Parser.new
    end

    def formatter
      Formatter.new
    end

    def resolver
      Resolver.new
    end

    def reducer
      Reducer.new
    end

    def splatter
      Splatter.new
    end
  end
end
