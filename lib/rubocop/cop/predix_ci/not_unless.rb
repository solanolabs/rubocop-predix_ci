# frozen_string_literal: true

module RuboCop
  module Cop
    module PredixCi
      # Checks for uses of unless with a negated condition.
      #
      # @example
      #
      #   # bad
      #
      #   unless foo
      #     bar
      #   end
      #
      #   # good
      #
      #   if !foo
      #     bar
      #   end
      #
      #   # bad
      #
      #   bar unless foo
      #
      #   # good
      #
      #   bar if !foo
      class NotUnless < Cop
        MSG = 'Favor `if !` over `unless` for negative conditions.'

        def on_if(node)
          return unless node.unless?

          add_offense(node, severity: :warning)
        end
      end
    end
  end
end
