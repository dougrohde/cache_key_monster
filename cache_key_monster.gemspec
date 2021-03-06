# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cache_key_monster/version'

Gem::Specification.new do |gem|
  gem.name          = "cache_key_monster"
  gem.version       = CacheKeyMonster::VERSION
  gem.authors       = ["Doug Rohde"]
  gem.email         = ["doug.rohde@tstmedia.com"]
  gem.description   = %q{A simple way to provide cache_key method to Plain Old Ruby objects}
  gem.summary       = %q{A simple way to provide cache_key method to Plain Old Ruby objects}
  gem.homepage      = "https://github.com/dougrohde/cache_key_monster"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
end
