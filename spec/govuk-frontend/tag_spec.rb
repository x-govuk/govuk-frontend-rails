include GovukFrontend

RSpec.describe GovukFrontend do

  it "outputs the right html" do

    examples = example_inputs("tag")

    examples.each do |example|
      expect(govukTag(example["data"])).to eq(example_output("tag/#{example["name"]}.html"))
    end

  end
end
