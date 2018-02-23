require_relative 'block'
require_relative 'expressions'

module Ast
  class IfStatement
    using ExpressionExtensions

    def initialize(condition, &block)
      @condition = condition.to_ex
      @block = Block.new(&block)
    end
  end
end
