require 'open-uri'
require 'json'
require 'yaml'

GOVUK_FRONTEND_VERSION = "3.7.0"

def underscore(camel_cased_word)
 camel_cased_word.to_s.gsub(/::/, '/').
   gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
   gsub(/([a-z\d])([A-Z])/,'\1_\2').
   tr("-", "_").
   downcase
end


snapshot_url = "https://template-service-spike.herokuapp.com/snapshot/govuk/#{GOVUK_FRONTEND_VERSION}"


data = open(snapshot_url).read
json = JSON.parse(data)

input_examples = {}

json.each do |item|
  component = underscore(item["componentName"]).gsub("govuk_", "")

  example_id = item["exampleId"].gsub("#{component.gsub("_", "-")}-", "")

  input_examples[component] ||= []

  input_examples[component] << {
    "name" => example_id,
    "data" => item["input"]
  }


  dir = File.join(File.dirname(__FILE__), "govuk-frontend/fixtures/output/#{component}")

  Dir.mkdir(dir) unless Dir.exist?(dir)

  file = File.open("#{dir}/#{example_id}.html", 'w')
  file.write item["output"]
  file.close

end

input_examples.each_pair do |component, examples|

  filename = File.join(File.dirname(__FILE__), "govuk-frontend/fixtures/input/#{component}.yaml")

  file = File.open(filename, 'w')
  file.write YAML.dump({"examples" => examples})
  file.close
end
