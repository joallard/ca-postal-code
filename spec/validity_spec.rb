RSpec.describe CAPostalCode do
  describe ".valid?" do
    [
      "a1a 2b1",
      "A1A 2B1",
      "A1A2B1",
      "A1A-2B1",
      " A1A 2B1",
      "A1A 2b1 "
    ].each do |postalcode|
      it "#{postalcode.inspect} should be valid" do
        expect(described_class.valid?(postalcode)).to be true
      end
    end

    [
      "gibberish",
      "a1a 2b",
      "",
      "a112b1",
      "Z1A 1A1",
      "A1A 1F1",
    ].each do |postalcode|
      it "#{postalcode.inspect} should not be valid" do
        expect(described_class.valid?(postalcode)).to be false
      end
    end
  end

  describe ".normalize" do
    [
      "a1a 2b1",
      "A1A-2B1",
      "A1A_2B1",
      "a1a 2b1 ",
    ].each do |postalcode|
      it "#{postalcode.inspect} should be normalized to 'A1A 2B1'" do
        expect(described_class.normalize(postalcode)).to eq "A1A 2B1"
      end
    end
  end
end
