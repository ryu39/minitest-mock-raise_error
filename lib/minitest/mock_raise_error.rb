# frozen_string_literal: true

require 'minitest/mock_raise_error/version'

module Minitest
  # A module that interrupts the #method_missing return value and
  # raises error if return value is a Exception.
  # This module is expected to be prepended to Minitest::Mock.
  module MockRaiseError
    private

    def method_missing(_method_name, *_args, &_block)
      super.tap do |ret_val|
        raise ret_val if ret_val.is_a?(Exception)
        raise ret_val if ret_val.is_a?(Class) && ret_val <= Exception
      end
    end
  end
end

require 'minitest/mock'

Minitest::Mock.prepend(Minitest::MockRaiseError)
