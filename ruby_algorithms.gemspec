lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_algorithms/version'

Gem::Specification.new do |s|
  s.name = RubyAlgorithms::NAME
  s.version = RubyAlgorithms::VERSION
  s.date = RubyAlgorithms::DATE
  s.summary = RubyAlgorithms::SUMMARY
  s.description = RubyAlgorithms::DESCRIPTION
  s.authors = RubyAlgorithms::AUTHORS
  s.email = RubyAlgorithms::EMAIL
  s.homepage = RubyAlgorithms::HOMEPAGE
  s.license = RubyAlgorithms::LICENSE
  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end
  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|s|features)/}) }
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = `find lib -type d`.split("\n")

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "minitest"
  s.add_development_dependency "minitest-reporters"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "byebug"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-rescue"


end