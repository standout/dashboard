# {Item} is a standardized data point
#
# Example
#   Item.new(name: "Thing", value: 123)
class Item
  ATTRS = %i(name value)

  attr_reader(*ATTRS)

  def initialize(**attrs)
    ATTRS.each do |attr|
      next unless attrs.key?(attr)
      send(:"#{attr}=", attrs.fetch(attr))
    end
  end

  def as_json(*)
    ATTRS.each_with_object({}) do |attr, obj|
      obj[attr.to_s] = public_send(attr)
    end
  end

  private

  attr_writer(*ATTRS)
end
