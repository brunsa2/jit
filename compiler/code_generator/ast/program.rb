module CodeGenerator
  module Ast
    module Program
      def compile(constants)
        function.compile(constants)
      end
    end
  end
end

module Ast
  class Program
    include CodeGenerator::Ast::Program
  end
end
