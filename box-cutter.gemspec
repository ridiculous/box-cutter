# -*- encoding: utf-8 -*-
require File.expand_path('../lib/box-cutter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Buckley"]
  gem.email         = ["arebuckley@gmail.com"]
  gem.description   = %q{helper methods for creating boxes}
  gem.summary       = %q{Helper methods for creating boxes}
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "box-cutter"
  gem.require_paths = ["lib"]
  gem.version       = Box::Cutter::VERSION
end
