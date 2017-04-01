lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/mock_raise_error/version'

Gem::Specification.new do |spec|
  spec.name          = 'minitest-mock_raise_error'
  spec.version       = Minitest::MockRaiseError::VERSION
  spec.authors       = ['ryu39']
  spec.email         = ['dev.ryu39@gmail.com']

  spec.summary       = 'A simple Minitest::Mock extension to raise a error'
  spec.description   = 'A simple Minitest::Mock extension to raise a error'
  spec.homepage      = 'https://github.com/ryu39/minitest-mock_raise_error'
  spec.license       = 'MIT'

  spec.files         = %w(LICENSE.txt) + Dir['lib/**/*.rb']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0' # Use Module#prepend

  spec.add_runtime_dependency 'minitest'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry'
end
