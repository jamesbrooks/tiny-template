require 'spec_helper'

describe "TinyTemplate::Base#parse acceptance" do
  it 'should accept an empty string' do
    parse('')
  end

  it 'should accept a empty tag' do
    parse('<a></a>')
  end

  it 'should accept text without any tags' do
    parse('text')
  end

  it 'should accept a tag containing text' do
    parse('<a>text</a>')
  end

  it 'should accept leading spaces' do
    parse(' <a>text</a>')
  end

  it 'should accept trailing spaces' do
    parse('<a>text</a> ')
  end

  it 'should accept spaces within tags' do
    parse('<a> text </a>')
  end

  it 'should accept correctly nested tags' do
    parse('<a><b></b></a>')
  end

  it 'should accept incorrectly closed tags if they can be recovered' do
    parse('<a>foo')
  end

  it 'should accept incorrectly nested tags if they can be recovered' do
    parse('<a><b></a>')
  end

  it 'should not accept incorrectly closed tags' do
    expect {
      parse('<a></b>')
    }.to raise_error(TinyTemplate::Node::MismatchedTag)
  end

  it 'should not accept incorrectly nested tags if they cannot be recovered' do
    expect {
      parse('<a><b></b></b>')
    }.to raise_error(TinyTemplate::Node::MismatchedTag)
  end

  it 'should return a root tag node for valid strings' do
    [
      'text',
      ' text',
      'text ',
      '<tag></tag>',
      ' <tag></tag>',
      '<tag></tag> ',
      '<a>text</a>',
      '<a> text</a>',
      '<a>text </a>',
      '<a><b>text</b></a>',
      '<a><b>text',
      '<a><b>text</b>',
      '<a><b>text</a>'
    ].each do |template|
      parse(template).should be_a_kind_of(TinyTemplate::Node::Tag)
    end
  end
end
