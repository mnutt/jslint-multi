require "spec"
require "gilt/widgets"

Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each do |file|
  require file
end

Spec::Runner.configure do |config|
  config.include Spec::Gilt::Matchers
  config.include Spec::Gilt::Helpers
end
