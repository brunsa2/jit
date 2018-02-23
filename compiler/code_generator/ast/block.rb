module CodeGenerator
  module Ast
    module Block
      def compile(constants, function_constant)
        function_constant.set 5
      end
    end
  end
end

module Ast
  class Block
    include CodeGenerator::Ast::Block
  end
end
