require "base24/version"

module Base24
  class Error < StandardError; end

  def self.encode24(data)
    raise "Data size must be multiple of 4" if data.size % 4 != 0

    data.unpack('C*').each_slice(4).reduce([]) do |result, slice|
      b0, b1, b2, b3 = slice

      value = b0 << 24 | b1 << 16 | b2 << 8 | b3

      sub_result, value = (0..6).reduce([[], value]) do |acc, i|
        res, value = acc
        idx = value % ASIZE
        value = value / ASIZE
        char = ENCODE_MAP[idx]

        [[char] + res, value]
      end

      result + sub_result
    end.join
  end

  def self.decode24(data)
    raise "Data size must be multiple of 7" if data.size % 7 != 0

    data.chars.each_slice(7).reduce([]) do |result, chars|
      value =
        chars.reduce(0) do |value, char|
          idx = DECODE_MAP[char]
          raise "Invalid character" if idx.nil?
          value * ASIZE + idx
        end
      mask = 0xFF
      b0 = (value & (mask << 24)) >> 24
      b1 = (value & (mask << 16)) >> 16
      b2 = (value & (mask << 8)) >> 8
      b3 = value & mask

      result + [b0, b1, b2, b3]
    end.pack('C*')
  end

  private

  def self.encode_map()
    ALPHABET.chars.reduce([{}, 0]) do |acc, char|
      map, idx = acc
      map[idx] = char
      [map, idx + 1]
    end[0]
  end

  def self.decode_map()
    ALPHABET.chars.reduce([{}, 0]) do |acc, char|
      map, idx = acc
      map[char] = idx
      map[char.downcase] = idx
      [map, idx + 1]
    end[0]
  end

  ALPHABET = "ZAC2B3EF4GH5TK67P8RS9WXY"
  ASIZE = ALPHABET.size
  ENCODE_MAP = encode_map
  DECODE_MAP = decode_map
end

