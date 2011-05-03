spec = Gem::Specification.new do |s|
  s.name = 'validates_email_whitelist_of'

  s.version = '1.0.2'
  s.summary = 'Validates e-mail address format (RFC2822 and RFC3696) and whitelist the domain part.'
  s.description  = "Rails 2 and Rails 3 plugin. #{s.summary}"
  s.homepage = 'https://github.com/rubenfonseca/validates_email_whitelist_of'
  s.extra_rdoc_files = ['README.markdown', 'MIT-LICENSE']

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_path = 'lib'
  s.rdoc_options << '--title' << 'validates_email_whitelist_of'

  s.authors = ['Ruben Fonseca']
  s.email = 'fonseka@gmail.com'

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=

  s.add_development_dependency "rspec", "~> 2.4.0"
  s.add_development_dependency "activerecord", "~> 2.3.11"
  s.add_development_dependency "sqlite3"
end
