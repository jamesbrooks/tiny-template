class TinyTemplate::Node
  attr_accessor :parent


  def to_s
    TinyTemplate::Renderer::String.render(self)
  end
end
