require_relative 'test_case'
require 'minitest/documentation'

module Minitest
  class DocumentationFormatTest < TestCase
    def setup
      Documentation.documentation!
      ExampleTest.generate_tests!
      self.reporter = Documentation.new io
    end
    attr_accessor :reporter

    def test_documentation_format
      ExampleTest.run reporter

      exp_format = <<-EOS
Minitest::Result
  a very long sentence
  pass
  verbosity
      EOS

      assert_equal exp_format, io.string
    end
  end
end
