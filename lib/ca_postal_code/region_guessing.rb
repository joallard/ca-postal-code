module CAPostalCode
  module RegionGuessing
    PATTERNS = {
      /^A/ => "NL",
      /^B/ => "NS",
      /^C/ => "PE",
      /^E/ => "NB",
      /^[GHJ]/ => "QC",
      /^[KLMNP]/ => "ON",
      /^R/ => "MB",
      /^S/ => "SK",
      /^T/ => "AB",
      /^V/ => "BC",
      /^X0[A-C]/ => "NU",
      /^X0[EG]|^X1A/ => "NT",
      /^Y/ => "YT",
    }

    # Guesses province or territory based on postal code first characters.
    #
    # Output is defined for valid, normalized postal codes only.
    def guess_region(string)
      entry = PATTERNS.detect do |pattern, region|
        pattern.match?(string)
      end

      entry[1] if entry
    end
  end
end
