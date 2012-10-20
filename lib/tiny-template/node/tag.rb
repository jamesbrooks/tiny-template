class TinyTemplate::Node::Tag < TinyTemplate::Node
  attr_accessor :name, :children


  def initialize(name=nil)
    self.name     = name
    self.children = []
  end

  def <<(node)
    children    << node
    node.parent  = self
  end
end
