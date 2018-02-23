require_relative 'function'
require_relative 'declaration'
require_relative 'assignment'
require_relative 'do_while_loop'
require_relative 'while_loop'
require_relative 'if_statement'
require_relative 'break_statement'

module Ast
  class Block
    def initialize(&block)
      @statements = []

      instance_eval(&block)
    end

    def function(parameters, &block)
      Function.new(parameters, &block)
    end

    def declare(variable)
      @statements << Declaration.new(variable)
    end

    def assign(variable, value)
      @statements << Assignment.new(variable, value)
    end

    def while_loop(condition, &block)
      @statements << WhileLoop.new(condition, &block)
    end

    def do_while_loop(condition, &block)
      @statements << DoWhileLoop.new(condition, &block)
    end

    def if_statement(condition, &block)
      @statements << IfStatement.new(condition, &block)
    end

    def loop_break
      @statements << BreakStatement.new
    end
  end
end
