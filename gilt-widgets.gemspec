# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gilt-widgets}
  s.version = "0.1.0.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Widget Author"]
  s.date = %q{2009-12-16}
  s.description = %q{Widget description (longer)}
  s.email = %q{widget-author@gilt.com}
  s.extra_rdoc_files = [
    "README.rdoc",
    "History.txt"
  ]
  s.files = [
    "spec/gilt/widgets/component_spec.rb",
    "spec/gilt/widgets_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/helpers.rb",
    "spec/support/matchers.rb",
    "README.rdoc",
    "History.txt"
  ]
  s.homepage = %q{http://TODO/url/to/documentation}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Widget summary (short)}
  s.test_files = [
    "spec/gilt/widgets/component_spec.rb",
    "spec/gilt/widgets_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/helpers.rb",
    "spec/support/matchers.rb"
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
