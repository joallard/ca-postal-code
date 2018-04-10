# CAPostalCode
Guesses the Canadian province or territory (*region*) based on the postal code.

For provinces and Yukon, it will guess based on the first letter. For Northwest Territories and Nunavut, it will check the first two or three characters.

## Usage
```ruby
CAPostalCode.guess_region("G1A 1A1")
# => "QC"

CAPostalCode.guess_region("X0C 1A1")
# => "NU"

CAPostalCode.guess_region("B6A 1A1")
# => "NS"
```

## Design decisions
### Validity

You should only feed the module valid postal codes. The result of invalid inputs in undefined. It will not check for validity (yet).

### Agnosticity and future-proofness

It does its best to produce a guess and tries to make the fewest assumptions about postal code validity or existence, in order to be the most future-proof.

For example, postal codes `B6A XXX` are not in use right now. However, Canada Post might start to use them before we get to know. Hence, we are generous in the guesses that we make.

