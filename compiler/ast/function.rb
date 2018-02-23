require_relative 'block'

module Ast
  class Function
    attr_reader :parameters, :block

    def initialize(parameters, &block)
      @parameters = parameters
      @block = Block.new(&block)
    end

    def to_ex
      self
    end
  end
end
