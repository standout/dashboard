module DataProvider
  class Provider
    def initialize(source)
      @source = source
    end

    def options
      @source.options
    end
  end
end
