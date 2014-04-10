module ChangeDate
  class Resolver
    def resolve(base:, operator:, value:)
      case operator
      when '+' then add(base: base, value: value)
      when '-' then sub(base: base, value: value)
      end
    end

    private

    def add(base:, value:)
      base + value
    end

    def sub(base:, value:)
      with_valid_args(base: base, value: value) do |base, value|
        base - value
      end
    end

    def with_valid_args(base:, value:)
      fail ArgumentError if value > base

      yield base, value
    end
  end
end
