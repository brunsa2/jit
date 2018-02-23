require_relative '../constants/function'

module CodeGenerator
  module Ast
    module Function
      def compile(constants)
        function_constant = Constants::Function.new
        block.compile(constants, function_constant)
        constants << function_constant
      end
    end
  end
end

module Ast
  class Function
    include CodeGenerator::Ast::Function
  end
end
