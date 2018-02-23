require_relative 'block'
require_relative 'expressions'

module Ast
  class WhileLoop
    using ExpressionExtensions

    def initialize(condition, &block)
      @condition, @body = condition.to_ex, Block.new(&block)
    end
  end
end
