require 'spec_helper'

describe "TinyTemplate::Base#parse structure" do
  describe "using simple text" do
    let(:template) { parse('text') }
    let(:node)     { template.children.first }


    it 'should contain one child' do
      template.children.size.should be(1)
    end

    it 'should be a text node' do
      node.should be_a_kind_of(TinyTemplate::Node::Text)
    end

    it 'should contain the value "text' do
      node.value.should eq('text')
    end
  end

  describe "using a simple tag" do
    let(:template) { parse('<tag></tag>') }
    let(:node)     { template.children.first }


    it 'should contain one child' do
      template.children.size.should be(1)
    end

    it 'should be a tag node' do
      node.should be_a_kind_of(TinyTemplate::Node::Tag)
    end

    it 'should have a tag name of "tag"' do
      node.name.should eq('tag')
    end

    it 'should not have any inner children' do
      node.children.should be_empty
    end
  end

  describe "multiple parallel tags" do
    let(:template) { parse('<a></a><a></a><a></a>') }


    it 'should contain three childen' do
      template.children.size.should be(3)
    end

    it 'should have all children as tags' do
      template.children.each do |child|
        child.should be_a_kind_of(TinyTemplate::Node::Tag)
      end
    end

    it 'should have all children as "a" tags' do
      template.children.each do |child|
        child.name.should eq('a')
      end
    end
  end
end
