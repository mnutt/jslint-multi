GEM_NAME = "gilt-widgets"

module GemHelpers

  def generate_gemspec
    $LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), "lib")))
    require "gilt/widgets"

    Gem::Specification.new do |s|
      s.name      = GEM_NAME
      s.version   = Gilt::Widgets::VERSION
      s.author    = "Widget Author"
      s.email     = "widget-author@gilt.com"
      s.homepage  = "http://TODO/url/to/documentation"
      s.summary   = "Widget summary (short)"
      s.description  = "Widget description (longer)"

      require "git"
      repo = Git.open(".")

      s.files      = normalize_files(repo.ls_files.keys - repo.lib.ignored_files)
      s.test_files = normalize_files(Dir['spec/**/*.rb'] - repo.lib.ignored_files)

      s.has_rdoc = true
      s.extra_rdoc_files = %w[README.rdoc History.txt]

      # TODO: Specify dependencies on other gems (either Gilt or public)
      # s.add_dependency "gilt-foobar", "~> 1.0"
      # s.add_dependency "activesupport", "1.0"
    end
  end

  def normalize_files(array)
    # only keep files, no directories, and sort
    array.select do |path|
      File.file?(path)
    end.sort
  end

  # Adds extra space when outputting an array. This helps create better version
  # control diffs, because otherwise it is all on the same line.
  def prettyify_array(gemspec_ruby, array_name)
    gemspec_ruby.gsub(/s\.#{array_name.to_s} = \[.+?\]/) do |match|
      leadin, files = match[0..-2].split("[")
      leadin + "[\n    #{files.split(",").join(",\n   ")}\n  ]"
    end
  end

  def read_gemspec
    @read_gemspec ||= eval(File.read("#{GEM_NAME}.gemspec"))
  end

  def sh(command)
    puts command
    system command
  end
end

class Default < Thor
  include GemHelpers

  desc "gemspec", "Regenerate #{GEM_NAME}.gemspec"
  def gemspec
    File.open("#{GEM_NAME}.gemspec", "w") do |file|
      gemspec_ruby = generate_gemspec.to_ruby
      gemspec_ruby = prettyify_array(gemspec_ruby, :files)
      gemspec_ruby = prettyify_array(gemspec_ruby, :test_files)
      gemspec_ruby = prettyify_array(gemspec_ruby, :extra_rdoc_files)

      file.write gemspec_ruby
    end

    puts "Wrote gemspec to #{GEM_NAME}.gemspec"
    read_gemspec.validate
  end

  desc "build", "Build a #{GEM_NAME} gem"
  def build
    sh "gem build #{GEM_NAME}.gemspec"
    FileUtils.mkdir_p "pkg"
    FileUtils.mv read_gemspec.file_name, "pkg"
  end

  desc "install", "Install the latest built gem"
  def install
    sh "gem install --local pkg/#{read_gemspec.file_name}"
  end

  desc "release", "Release the current branch to GitHub and Gemcutter"
  def release
    gemspec
    build
    Release.new.tag
    Release.new.gem
  end
end

class Release < Thor
  include GemHelpers

  desc "tag", "Tag the gem on the origin server"
  def tag
    release_tag = "v#{read_gemspec.version}"
    sh "git tag -a #{release_tag} -m 'Tagging #{release_tag}'"
    sh "git push origin #{release_tag}"
  end

  desc "gem", "Push the gem to Gemcutter"
  def gem
    sh "gilt-release-gem pkg/#{read_gemspec.file_name}"
  end
end
