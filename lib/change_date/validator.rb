module ChangeDate
  class Validator
    VALID_OPERATORS = %w(+ -)

    def validate!(date:, operator:, value:)
      validate_operator!(operator)
    end

    private

    def validate_operator!(operator)
      fail ArgumentError unless VALID_OPERATORS.include?(operator)
    end
  end
end
