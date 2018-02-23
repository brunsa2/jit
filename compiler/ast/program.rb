require_relative 'function'

module Ast
  class Program
    attr_reader :function

    def initialize(&block)
      @function = Function.new([], &block)
    end
  end
end
