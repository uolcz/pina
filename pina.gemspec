lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pina/version'

Gem::Specification.new do |spec|
  spec.name          = 'pina'
  spec.version       = Pina::VERSION
  spec.authors       = ['Pavel Hronek']
  spec.email         = ['hronek@uol.cz']

  spec.summary       = 'Fantozzi REST API client'
  spec.description   = 'Fantozzi REST API client'
  spec.homepage      = 'https://github.com/ucetnictvi-on-line/pina'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 is required to protect against public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'factory_girl'
  spec.add_development_dependency 'dotenv'

  spec.add_runtime_dependency 'typhoeus'
  spec.add_runtime_dependency 'virtus'
  spec.add_runtime_dependency 'activesupport'
end
