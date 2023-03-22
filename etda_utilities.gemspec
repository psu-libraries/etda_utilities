# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "etda_utilities/version"

Gem::Specification.new do |spec|
  spec.name          = "etda_utilities"
  spec.version       = EtdaUtilities::VERSION
  spec.authors       = ["ajk5603@psu.edu"]
  spec.email         = ["ajk5603@psu.edu"]

  spec.summary       = 'A gem containing common fuctions for the ETDA applications.'
  spec.description   = 'Contains Partner, .., ..., etc. '
  spec.homepage      =  'https://github.com/psu-stewardship/etda_utilities'
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/etda_utilities"]

  spec.required_ruby_version = '~> 3.1'

  spec.add_development_dependency "bundler", "~> 2.3.a"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
