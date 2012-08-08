# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rubdo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Teo Ljungberg"]
  gem.email         = ["teo.ljungberg@gmail.com"]
  gem.description   = %q{A quick and dirty todo application}
  gem.summary       = %q{A quick and dirty todo application}
  gem.homepage      = "http://github.com/metamorfos/rubdo"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rubdo"
  gem.require_paths = ["lib"]
  gem.version       = Rubdo::VERSION
end
