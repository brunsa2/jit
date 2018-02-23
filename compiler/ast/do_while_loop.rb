require_relative 'block'
require_relative 'expressions'

module Ast
  class DoWhileLoop
    using ExpressionExtensions

    def initialize(condition, &block)
      @condition = condition.to_ex
      @body = Block.new(&block)
    end
  end
end
