# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tiny-template/version'

Gem::Specification.new do |gem|
  gem.name          = "tiny-template"
  gem.version       = TinyTemplate::VERSION
  gem.authors       = ["James Brooks"]
  gem.email         = ["james@gooddogdesign.com"]
  gem.description   = 'Simple tag based templating engine for ruby'
  gem.summary       = 'Simple tag based templating engine for ruby'
  gem.homepage      = 'https://github.com/JamesBrooks/tiny-template'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
