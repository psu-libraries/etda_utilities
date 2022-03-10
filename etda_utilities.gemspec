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
  spec.homepage      =  'https://etda.libraries.psu.edu'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/etda_utilities"]

  spec.add_development_dependency "bundler", "~> 2.3.a"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
