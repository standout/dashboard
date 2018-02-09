require_relative 'data_provider/provider'
require_relative 'data_provider/registry'

module DataProvider
  @registry = Registry.new

  def self.register(name, klass, options = {}, &block)
    @registry.add_provider(name, klass, options, &block)
  end

  def self.providers
    @registry.providers
  end
end
