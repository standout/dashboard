class NotFoundDataProvider
  CACHE_COUNT_KEY = 'not_found/count'.freeze

  Response = Struct.new(:data, :expires_at)

  def initialize(options = {})
    @options = options
  end

  def fetch
    cache.write(CACHE_COUNT_KEY, count + 1)
    [{
      data: "\xF0\x9F\x99\x88",
      type: 'number',
      title: title_based_on_count
    }]
  end

  private

  def cache
    @options[:cache]
  end

  def count
    cache.fetch(CACHE_COUNT_KEY) || 0
  end

  def title_based_on_count
    return 'Hoppsan! Du är den första som har hamnat lite fel.' if count.zero?
    "Hoppsan! Du har som #{count} andra hamnat lite fel."
  end
end
