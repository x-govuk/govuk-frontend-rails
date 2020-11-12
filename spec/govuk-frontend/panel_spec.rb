require "spec_helper"

RSpec.describe "panel" do
  it "outputs the right html" do
    fixtures("panel").each do |example|
      expect(govukPanel(example["options"])).to match_html_of(example["html"])
    end
  end
end
