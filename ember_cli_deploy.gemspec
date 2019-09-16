# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ember_cli_deploy/version'

Gem::Specification.new do |spec|
  spec.name          = 'ember_cli_deploy'
  spec.version       = EmberCliDeploy::VERSION
  spec.authors       = ['Endri Gjiri']
  spec.email         = ['egjiri@gmail.com']

  spec.summary       = 'Provides a simple way to interact with Redis using the ember-cli-deploy-redis conventions'
  spec.description   = 'Provides a simple way to interact with Redis using the ember-cli-deploy-redis conventions'
  spec.homepage      = 'https://github.com/egjiri/ember_cli_deploy'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'redis', '>= 3.0.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
