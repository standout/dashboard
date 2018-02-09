require 'data_provider/lib/data_provider'

DataProvider.configure do |c|
  c.cache_store = Rails.cache
end
