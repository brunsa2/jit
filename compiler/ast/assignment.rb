require_relative 'expressions'

module Ast
  class Assignment
    using ExpressionExtensions

    def initialize(variable, value)
      @variable = variable
      @value = value&.to_ex
    end
  end
end
