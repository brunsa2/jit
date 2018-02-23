require_relative 'expressions'

module Ast
  class Declaration
    using ExpressionExtensions

    def initialize(variable)
      @variable = variable
    end
  end
end
