module TinyTemplate::Base
  def parse(str)
    TinyTemplate::Node::Tag.new.tap do |node|
      str.split(/(?<!\\)<(.+?)>/).zip([:text, :tag].cycle).each do |content, type|
        content = content.strip
        next if content.empty?

        case type
        when :text
          node << TinyTemplate::Node::Text.new(content)

        when :tag
          if /\/(?<name>.*)/ =~ content
            # Simple recovery; close tags until we see the close tag we expect
            until name == node.name || node.parent.nil?
              node = node.parent
            end

            unless name == node.name
              raise TinyTemplate::Node::MismatchedTag.new
            end

            node = node.parent
          else
            node << (node = TinyTemplate::Node::Tag.new(content))
          end
        end
      end
    end
  end
end
