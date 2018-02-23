require_relative 'ast/program'
require_relative 'ast/function'
require_relative 'ast/block'

module CodeGenerator
  class Output
    def initialize(ast)
      @constants = []
      ast.compile(@constants)
    end
  end
end
