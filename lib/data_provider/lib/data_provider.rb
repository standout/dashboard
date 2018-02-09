require_relative 'data_provider/configuration'
require_relative 'data_provider/provider'
require_relative 'data_provider/registry'

module DataProvider
  @configuration = Configuration.new
  @registry = Registry.new

  def self.config
    @configuration
  end

  def self.configure
    yield @configuration if block_given?
  end

  def self.register(name, klass, options = {}, &block)
    @registry.add_provider(name, klass, options, &block)
  end

  def self.providers
    @registry.providers
  end
end
