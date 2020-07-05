require "ca_postal_code/version"
require "ca_postal_code/region_guessing"

module CAPostalCode
  extend RegionGuessing

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
    strict_valid?(string)
  end

  def self.strict_valid?(string)
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
end
