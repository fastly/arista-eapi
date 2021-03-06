# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arista/eapi/version'

Gem::Specification.new do |spec|
  spec.name          = "arista-eapi"
  spec.version       = Arista::EAPI::VERSION
  spec.authors       = ["Mark Imbriaco"]
  spec.email         = ["mark@imbriaco.com"]
  spec.homepage      = 'https://github.com/imbriaco/arista-eapi'
  spec.description   = %q{Client for Arista Networks eAPI - Fastly's version}
  spec.summary       = %q{Arista eAPI Client}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 0"

  spec.add_runtime_dependency "rest-client", '~> 1.7', '>= 1.7.3'
  spec.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.1'
end
