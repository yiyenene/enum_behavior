module EnumBehavior
  class Base
    def initialize(model)
      @model = model
    end

    attr_reader :model
  end
end
