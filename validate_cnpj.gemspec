# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validate_cnpj/version'

Gem::Specification.new do |spec|
  spec.name          = "validate_cnpj"
  spec.version       = ValidateCnpj::VERSION
  spec.authors       = ["RamonHossein"]
  spec.email         = ["hosseinramon@gmail.com"]

  spec.summary       = %q{Validates Cnpj}
  spec.homepage      = "https://github.com/RamonHossein/validate_cnpj"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "activemodel"
  spec.add_development_dependency "pry"
end
