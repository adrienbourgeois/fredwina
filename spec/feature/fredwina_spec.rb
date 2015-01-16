RSpec.describe 'fredwina' do
  context "dogs stay inside the paddock and don't bump into each other" do
    it "returns the final positions of the dogs" do
      expect(Fredwina.move("../fixtures/input_example_success.text")).to eq("1 3 N\n5 1 E")
    end
  end

  context "at least one dog tries to go outside the paddock" do
    it "returns an appropriate error message" do
      expect(Fredwina.move("../fixtures/input_example_error1.text")).to eq("The dogs have to stay inside of the paddock")
    end
  end

  context "at least one dog bump into another dog" do
    it "returns an appropriate error message" do
      expect(Fredwina.move("../fixtures/input_example_error2.text")).to eq("The dogs cannot bump into each other")
    end
  end
end