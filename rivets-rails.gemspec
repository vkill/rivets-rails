# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rivets-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "rivets-rails"
  gem.version       = Rivets::Rails::VERSION
  gem.authors       = ["vkill"]
  gem.email         = ["vkill.net@gmail.com"]
  gem.description   = %q{Rivets plugin for Rails}
  gem.summary       = %q{Rivets plugin for Rails}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
