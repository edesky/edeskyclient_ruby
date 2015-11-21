require 'minitest/autorun'
require_relative '../lib/edesky_client'

# client test
class TestEdeskyClient < Minitest::Test
  def setup
    @client = EdeskyClient.new
  end

  def test_get_documents
    raise "TODO tests"
  end
end
