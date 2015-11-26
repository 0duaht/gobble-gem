# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gobble/version'

Gem::Specification.new do |spec|
  spec.name          = "gobble"
  spec.version       = Gobble::VERSION
  spec.authors       = ["Tobi Oduah"]
  spec.email         = ["tobi.oduah@andela.com"]

  spec.summary       = "Easy-to-use gem to interface with the Gobble-It API"
  spec.description   = "For more details, Visit http://gobble-it.herokuapp.com/api for more instructions"
  spec.homepage      = "http://gobble-it.herokuapp.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.files = Dir.glob("{bin,lib}/**/*")
  #spec.bindir        = "bin"
  spec.executables   = ["gobble"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
