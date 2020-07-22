require "bundler/setup"
require "govuk-frontend"
require "json"

include GovukFrontend

def fixtures(component_name)
  file = File.read(File.join(File.dirname(__FILE__), "../node_modules/govuk-frontend/govuk/components/", component_name + "/fixtures.json"))

  JSON.parse(file)["fixtures"]
end
