lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'algorithms/version'

Gem::Specification.new do |s|
  s.name = 'algorithms'
  s.version = Algorithms::VERSION
  s.date = '2016-03-30'
  s.summary = 'This gem includes the common data structures and algorithms.'
  s.description = 'This gem includes the common data structures and algorithms.'
  s.authors = ['Uchenna F. Okoye']
  s.email = 'uchennafokoye@gmail.com'
  s.files = ['lib/algorithms.rb', 'lib/algorithms/data_structures']
  s.homepage = 'http://rubygems.org/gems/algorithms'
  s.license = 'MIT'
  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end
  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|s|features)/}) }
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
end