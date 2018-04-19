require "ca_postal_code/version"

module CAPostalCode

  # > Postal codes do not include the letters D, F, I, O, Q or U,
  # > and the first position also does not make use of the letters W or Z.
  PATTERN = %r{
    [ABCEGHJKLMNPRSTVXY]
    [0-9]
    [ABCEGHJKLMNPRSTVWXYZ]
    \ ?
    [0-9]
    [ABCEGHJKLMNPRSTVWXYZ]
    [0-9]
  }x

  def self.valid?(string)
    return false unless string = normalize(string)

    string.match? PATTERN
  end

  # Normalize postal code into "A1A 1A1" format.
  #
  # Will return `nil` if the normalized string does not have 6 characters.
  def self.normalize(string)
    string.strip!
    string.upcase!
    string.gsub!(/\W/, '')

    return unless string.length == 6

    string = string[0..2] + " " + string[3..5]
    string
  end

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

  def self.guess_region(string)
    entry = patterns.detect do |pattern, region|
      pattern.match?(string)
    end

    entry[1] if entry
  end

  # Lists the patterns the library will use. It is made public only to
  # make the implementation visible.
  def self.patterns
    @@patterns
  end

  private

  def self.add_pattern(pattern, region)
    unless pattern.is_a?(Regexp)
      pattern = Regexp.new("^" + pattern)
    end

    @@patterns[pattern] = region.to_s
  end

  @@patterns = {}

  REGIONS.each do |region, patterns|
    unless patterns.is_a?(Array)
      patterns = [patterns]
    end

    patterns.each do |pattern|
      add_pattern(pattern, region)
    end
  end
end
