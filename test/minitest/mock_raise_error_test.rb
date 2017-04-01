# frozen_string_literal: true

require 'test_helper'

class Minitest::MockRaiseErrorTest < Minitest::Test
  MyTestError = Class.new(Exception)

  def test_that_it_has_a_version_number
    refute_nil Minitest::MockRaiseError::VERSION
  end

  def test_that_mock_raises_error_when_ret_val_is_a_exception
    mock = Minitest::Mock.new
    error = MyTestError.new('my_test')
    mock.expect(:my_test, error)

    assert_raises MyTestError, 'my_test' do
      mock.my_test
    end
    mock.verify
  end

  def test_that_mock_raises_error_when_ret_val_is_a_sub_class_of_exception
    mock = Minitest::Mock.new
    mock.expect(:my_test, MyTestError)

    assert_raises MyTestError do
      mock.my_test
    end
    mock.verify
  end

  def test_that_mock_does_not_raise_error_when_ret_val_is_not_a_exception_or_a_sub_class_of_exception
    mock = Minitest::Mock.new
    mock.expect(:my_test, 'Not Exception')

    assert_equal('Not Exception', mock.my_test)
    mock.verify
  end
end
