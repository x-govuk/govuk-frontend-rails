require "spec_helper"

RSpec.describe "back link" do
  it "outputs the right html" do
    fixtures("back-link").each do |example|
      expect(govukBackLink(example["options"])).to match_html_of(example["html"])
    end
  end
end
