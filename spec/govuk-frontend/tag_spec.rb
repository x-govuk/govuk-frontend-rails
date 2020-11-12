require "spec_helper"

RSpec.describe "tag" do
  it "outputs the right html" do
    fixtures("tag").each do |example|
      expect(govukTag(example["options"])).to match_html_of(example["html"])
    end
  end
end
