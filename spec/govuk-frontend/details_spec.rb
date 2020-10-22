require "spec_helper"

RSpec.describe "details" do

  fixtures("details").each do |example|
    context example["name"] do
      it "outputs the right HTML" do
        expect(govukDetails(example["options"])).to eq(example["html"]), "HTML for example '#{example["name"]}' doesn’t match"
      end
    end
  end
end
