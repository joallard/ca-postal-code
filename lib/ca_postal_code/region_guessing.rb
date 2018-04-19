module CAPostalCode
  module RegionGuessing

    REGIONS = {
      NL: ?A,
      NS: ?B,
      PE: ?C,
      NB: ?E,
      QC: [?G, ?H, ?J],
      ON: [?K, ?L, ?M, ?N, ?P],
      MB: ?R,
      SK: ?S,
      AB: ?T,
      BC: ?V,
      NU: /^X0[A-C]/,
      NT: [/^X0[EG]/, /^X1A/],
      YT: ?Y,
    }

    # Guesses province or territory based on postal code first characters.
    #
    # Output is defined for valid, normalized postal codes only.
    def guess_region(string)
      entry = region_patterns.detect do |pattern, region|
        pattern.match?(string)
      end

      entry[1] if entry
    end

    # Lists the patterns the library will use. It is made public only to
    # make the implementation visible.
    def region_patterns
      @@region_patterns
    end

    private

    def self.add_pattern(pattern, region)
      unless pattern.is_a?(Regexp)
        pattern = Regexp.new("^" + pattern)
      end

      @@region_patterns[pattern] = region.to_s
    end

    @@region_patterns = {}

    REGIONS.each do |region, patterns|
      unless patterns.is_a?(Array)
        patterns = [patterns]
      end

      patterns.each do |pattern|
        add_pattern(pattern, region)
      end
    end
  end
end
