$:.push File.expand_path('../lib', __FILE__)

require 'subexec/version'

Gem::Specification.new do |s|
  s.name        = 'subexec'
  s.version     = Subexec::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Subexec spawns a subprocess with an optional timeout"
  s.description = s.summary

  s.authors     = ["Peter Kieltyka"]
  s.email       = ["peter@nulayer.com"]
  s.homepage    = "http://github.com/nulayer/subexec"

  s.files        = Dir['README.md', 'lib/**/*']
  s.require_path = 'lib'

  s.add_dependency('posix-spawn', ['~> 0.3'])

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', ['~> 2.8.0'])
end
