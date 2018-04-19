RSpec.describe CAPostalCode do
  describe "RegionGuessing" do
    describe ".guess_region" do
      {
        "A1A 1A1": "NL",
        "G1A 1A1": "QC",
        "X0C 1A1": "NU",
        "X0E 1A1": "NT",
        "Z1A 1A1": nil,
      }.each do |postal_code, region|
        it "#{postal_code} should map to #{region.inspect}" do
          expect(
            CAPostalCode.guess_region(postal_code)
          ).to eq(region)
        end
      end
    end

    describe ".region_patterns" do

      # The output is somewhat an internal concern
      it "maps 'X1A' to 'NT'" do
        expect(
          subject.region_patterns[/^X1A/]
        ).to eq "NT"
      end
    end
  end
end
