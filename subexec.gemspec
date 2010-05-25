version = File.read("VERSION").strip

Gem::Specification.new do |s|
  s.name        = 'subexec'
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Subexec spawns an external command with a timeout"
  s.description = "Subexec spawns an external command with a timeout"
  
  s.authors     = ["Peter Kieltyka"]
  s.email       = ["peter@nulayer.com"]
  s.homepage    = "http://github.com/nulayer/subexec"

  s.files        = Dir['README.rdoc', 'VERSION', 'lib/**/*']
  s.require_path = 'lib'
end

