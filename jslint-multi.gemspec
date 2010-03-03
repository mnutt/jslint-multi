# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jslint-multi}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Nutt"]
  s.date = %q{2010-03-02}
  s.description = %q{jslint-rails runs jslint on each js file in public/javascripts and returns the proper unix error codes.}
  s.email = %q{mnutt@gilt.com}
  s.executables = ["jslint-multi"]
  s.extra_rdoc_files = [
    "README.rdoc",
    "History.txt"
  ]
  s.files = [
    ".gitignore",
    "Gemfile",
    "History.txt",
    "README.rdoc",
    "Rakefile",
    "Thorfile",
    "lib/jslint_multi.rb",
    "spec/jslint_multi_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "spec/support/bad.js",
    "spec/support/good.js",
    "vendor/jslint-1.0-multi.js",
    "vendor/rhino1_7R2-RC1.jar"
  ]
  s.homepage = %q{http://github.com/mnutt/jslint-rails}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Rake tasks to validate javascripts with jslint}
  s.test_files = [
    "spec/jslint_multi_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
