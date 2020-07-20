require "bundler/setup"
require "govuk-frontend"
require 'yaml'

def example_inputs(component_name)
  yaml_file = File.read(File.join(File.dirname(__FILE__), "govuk-frontend/fixtures/input", component_name + ".yaml"))

  YAML.load(yaml_file)["examples"]
end

def example_output(path)
  File.read(File.join(File.dirname(__FILE__), "govuk-frontend/fixtures/output", path)).strip
end

RSpec.configure do |config|

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
