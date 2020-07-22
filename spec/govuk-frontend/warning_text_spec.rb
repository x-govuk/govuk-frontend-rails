require "spec_helper"

RSpec.describe "warning text" do
  it "outputs the right html" do
    fixtures("warning-text").each do |example|
      expect(govukWarningText(example["options"])).to eq(example["html"]), "HTML for example '#{example["name"]}' doesn’t match"
    end
  end
end
