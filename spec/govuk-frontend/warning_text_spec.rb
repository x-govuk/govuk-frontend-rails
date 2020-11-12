require "spec_helper"

RSpec.describe "warning text" do
  it "outputs the right html" do
    fixtures("warning-text").each do |example|
      expect(govukWarningText(example["options"])).to match_html_of(example["html"])
    end
  end
end
