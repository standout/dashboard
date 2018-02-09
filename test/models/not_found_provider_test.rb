require 'test_helper'

class NotFoundDataProviderTest < ActiveSupport::TestCase
  def setup
    @cache = Minitest::Mock.new
  end

  def test_fetch_no_cache
    provider = NotFoundDataProvider.new(cache: @cache)
    @cache.expect :fetch, nil, ['not_found/count']
    @cache.expect :write, true, ['not_found/count', 1]

    response = provider.fetch

    assert_mock @cache
    assert_equal "\xF0\x9F\x99\x88", response.data[0][:data]
    assert_equal 'number', response.data[0][:type]
    assert_equal 'Hoppsan! Du är den första som har hamnat lite fel.', response.data[0][:title]
  end

  def test_fetch_from_cache
    provider = NotFoundDataProvider.new(cache: @cache)
    @cache.expect :fetch, 2, ['not_found/count']
    @cache.expect :write, true, ['not_found/count', 3]

    response = provider.fetch

    assert_mock @cache
    assert_equal "\xF0\x9F\x99\x88", response.data[0][:data]
    assert_equal 'number', response.data[0][:type]
    assert_equal 'Hoppsan! Du har som 2 andra hamnat lite fel.', response.data[0][:title]
  end

  private

  def wrap_as_provider(name, provider, cache)
    DataProvider::Provider.new(name, provider, cache)
  end
end
