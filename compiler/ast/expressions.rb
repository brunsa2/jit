module Ast
  class Expression
    def to_ex
      self
    end
  end

  class FalseExpression < Expression; end

  class TrueExpression < Expression; end

  class IntegerExpression < Expression
    def initialize(value)
      @value = value
    end
  end

  class VariableExpression < Expression
    def initialize(variable)
      @variable = variable
    end
  end

  class BinaryExpression < Expression
    def initialize(left, right)
      @left = Expression::to_ex(left)
      @right = Expression::to_ex(right)
    end
  end

  class AddExpression < BinaryExpression; end

  class SubtractExpression < BinaryExpression; end

  class LessThanExpression < BinaryExpression; end

  class GreaterThanExpression < BinaryExpression; end

  class SubscriptExpression < BinaryExpression; end

  class Expression
    def <(other)
      LessThanExpression.new(self, other)
    end

    def >(other)
      GreaterThanExpression.new(self, other)
    end
  end

  module ExpressionExtensions
    refine Fixnum do
      def to_ex
        IntegerExpression.new(self)
      end

      def +(other)
        # TODO: this should be on Numeric
        AddExpression.new(self, other)
      end
    end

    refine TrueClass do
      def to_ex
        TrueExpression.new
      end
    end

    refine FalseClass do
      def to_ex
        FalseExpression.new
      end
    end

    refine Symbol do
      def to_ex
        VariableExpression.new(self)
      end

      def +(other)
        AddExpression.new(self, other)
      end

      def -(other)
        SubtractExpression.new(self, other)
      end

      def <(other)
        LessThanExpression.new(self, other)
      end

      def [](index)
        SubscriptExpression.new(self, index)
      end
    end
  end

  class Expression
    # `ExpressionExtensions` module defined below expression classes so they
    # can't use refinements until defined. Static method here gets around this
    using ExpressionExtensions

    def self.to_ex(value)
      value.to_ex
    end
  end
end
