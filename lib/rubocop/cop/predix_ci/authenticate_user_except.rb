# frozen_string_literal: true

module RuboCop
  module Cop
    module PredixCi
      #
      # Checks that all controller authenticate_user! are enforcing "except" and not "only" rules
      #
      # @example
      #
      #   # bad
      #
      #   before_filter :authenticate_user!, only: %w[:new, :create, :update, :delete]
      #
      #   # good
      #
      #   before_filter :authenticate_user!, except: %w[:show, :edit, :index]
      #   before_action :authenticate_user!, except: %w[:show, :edit, :index]
      #
      class AuthenticateUserExcept < Cop
        MSG = 'Favor `except:` over `only:` for :authenticate_user! method'
        BASE_PATTERN = 'send _ {:before_filter :before_action} (sym :authenticate_user!)'
        SUB_PATTERN = '(pair (sym $:only) ...)'

        def on_send(node)
          return unless verify_pattern?(node, "(#{BASE_PATTERN} (hash ... #{SUB_PATTERN}) )") ||
                        verify_pattern?(node, "(#{BASE_PATTERN} (hash #{SUB_PATTERN} ...) )")

          match_nodes = node.arguments[1].children
          result_node = match_nodes.detect do |n|
            verify_pattern?(n, SUB_PATTERN)
          end

          add_offense(node, location: result_node.loc.expression)
        end

        private

        def verify_pattern?(node, pattern)
          RuboCop::NodePattern.new(pattern).match(node)
        end
      end
    end
  end
end
