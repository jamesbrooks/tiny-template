module TinyTemplate::Renderer
  class String
    def self.render(node)
      ''.tap do |str|
        case node
        when TinyTemplate::Node::Tag
          str << "<#{node.name}>" if node.name
          node.children.each { |child| str << render(child) }
          str << "</#{node.name}>" if node.name

        when TinyTemplate::Node::Text
          str << node.value
        end
      end
    end
  end
end
