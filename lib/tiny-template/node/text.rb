class TinyTemplate::Node::Text < TinyTemplate::Node
  attr_accessor :value


  def initialize(value='')
    self.value = value
  end
end
