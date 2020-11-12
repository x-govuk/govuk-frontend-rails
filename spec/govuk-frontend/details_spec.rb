require "spec_helper"

RSpec.describe "details" do

  fixtures("details").each do |example|
    context example["name"] do
      it "outputs the right HTML" do
        expect(govukDetails(example["options"])).to match_html_of(example["html"])
      end
    end
  end
end
