Gem::Specification.new do |s|
  s.name        = 'edesky-client'
  s.version     = '0.0.6'
  s.date        = '2015-11-23'
  s.summary     = "Ruby klient pro edesky.cz API"
  s.description = "Ruby klient pro edesky.cz HTTP API, hledání dokumentů a úředních desek."
  s.authors     = ["Marek Aufart"]
  s.email       = 'aufi.cz@gmail.com'
  s.files       = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{spec/})
  s.require_paths = ["lib"]
  s.homepage    = 'https://github.com/edesky/edeskyclient_ruby'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.0.0'

  s.add_runtime_dependency 'xml-simple', '~> 1.1'
  s.add_development_dependency 'minitest', '~> 5.0'
end
