require 'pp'

require_relative 'ast/program'
require_relative 'ast/expressions'

require_relative 'code_generator/output'

ast = (lambda do
  using Ast::ExpressionExtensions
  Ast::Program.new do
    declare :x
    assign :x, 0

    declare :y
    assign :y, (function %i(x y) do
      declare :z
    end)
  end
end).call

pp ast
puts

compiled_code = CodeGenerator::Output.new(ast)
pp compiled_code
