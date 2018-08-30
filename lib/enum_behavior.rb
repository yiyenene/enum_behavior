require "enum_behavior/version"
require "enum_behavior/base"

require "active_support"
require "active_support/core_ext"

module EnumBehavior
  extend ActiveSupport::Concern

  class_methods do
    def enum_behavior(enum_name)
      behavior_name = "#{enum_name}_behavior"
      define_method(behavior_name) do
        current = public_send(enum_name)
        return nil if current.nil?
        class_name = "#{self.class.name.pluralize}::#{current.camelize}"
        class_name.constantize.new(self)
      end
    end
  end
end
