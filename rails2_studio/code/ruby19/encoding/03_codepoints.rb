irb(main):010:0> "peanut butter¿".bytes.to_a
# => [112, 101, 97, 110, 117, 116, 32, 98, 117, 116, 116, 101, 114, 194, 191]
irb(main):011:0> "peanut butter¿".codepoints.to_a
# => [112, 101, 97, 110, 117, 116, 32, 98, 117, 116, 116, 101, 114, 191]
