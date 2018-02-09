module DataProvider
  class Registry
    attr_reader :providers

    def initialize
      @providers = {}
    end

    def add_provider(name, klass, options = {})
      @providers[name] = Provider.new(klass.new(options))
    end
  end
end
