require "bundler/setup"
require "govuk-frontend"
require "json"

include GovukFrontend

def fixtures(component_name)
  file = File.read(File.join(File.dirname(__FILE__), "../node_modules/govuk-frontend/govuk/components/", component_name + "/fixtures.json"))

  JSON.parse(file)["fixtures"]
end


RSpec::Matchers.define :match_html_of do |expected|
  match do |actual|
    actual.gsub(/\s+/, " ") == expected.gsub(/\s+/, " ")
  end
  failure_message do |actual|
    "expected:\n\n#{actual.gsub(/\s+/, " ")}\n\nto be the same as\n\n#{expected.gsub(/\s+/, " ")}"
  end
end
