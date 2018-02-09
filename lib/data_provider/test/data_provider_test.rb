require 'minitest/autorun'
require_relative '../lib/data_provider'

class GitHubProvider
  attr_reader :options

  def initialize(options = {})
    @options = options
  end
end

class DataProviderTest < Minitest::Test
  def test_register
    DataProvider.register :github, GitHubProvider
    assert_instance_of DataProvider::Provider, DataProvider.providers[:github]
  end

  def test_register_with_options
    DataProvider.register :github, GitHubProvider, username: 'standout'
    assert_equal 'standout', DataProvider.providers[:github].options[:username]
  end

  def test_get_provider_by_string
    DataProvider.register :github, GitHubProvider
    assert_instance_of DataProvider::Provider, DataProvider.providers['github']
  end

end
