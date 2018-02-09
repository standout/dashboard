require 'minitest/autorun'
require_relative '../lib/data_provider'

class GitHubProvider
  DATA = [{ data: 2, type: 'number', title: 'Antal' }].freeze
  EXPIRES_IN_SECONDS = 60
  Response = Struct.new(:data, :expires_at)

  attr_reader :options

  def initialize(options = {})
    @options = options
  end

  def fetch
    Response.new(DATA, Time.now + EXPIRES_IN_SECONDS)
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

  def test_fetch_empty_cache
    cache_store = Minitest::Mock.new

    DataProvider.configure do |c|
      c.cache_store = cache_store
    end

    DataProvider.register :github, GitHubProvider

    cache_store.expect :fetch, nil, [
      'github/data'
    ]

    cache_store.expect :write, true, [
      'github/data',
      GitHubProvider::DATA,
      expires_in: GitHubProvider::EXPIRES_IN_SECONDS
    ]

    Timecop.freeze(Time.now) do
      DataProvider.providers[:github].fetch
      assert_mock cache_store
    end
  end

  def test_fetch_with_data_in_cache
    cache_store = Minitest::Mock.new

    DataProvider.configure do |c|
      c.cache_store = cache_store
    end

    DataProvider.register :github, GitHubProvider

    cache_store.expect :fetch, GitHubProvider::DATA, [
      'github/data'
    ]

    Timecop.freeze(Time.now) do
      data = DataProvider.providers[:github].fetch
      assert_mock cache_store
      assert_equal GitHubProvider::DATA, data
    end
  end
end
