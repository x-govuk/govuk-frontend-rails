require "spec_helper"

RSpec.describe "tag" do
  it "outputs the right html" do
    fixtures("tag").each do |example|
      expect(govukTag(example["options"])).to eq(example["html"]), "HTML for example '#{example["name"]}' doesn’t match"
    end
  end
end
