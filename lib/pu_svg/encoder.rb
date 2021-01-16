# frozen_string_literal: true

require "zlib"

module PuSvg
  ##
  # PlantUML API uri encoder
  module Encoder
    class << self

      def encode(text)
        text = text.force_encoding("UTF-8")
        deflated = Zlib::Deflate.deflate(text, 9)
        encode64(deflated)
      end

      private

      def encode64(data)
        result = ""
        result += "~1"

        data.chars.each_slice(3) do |bytes|
          bit1 = bytes[0].nil? ? 0 : (bytes[0].ord & 0xFF)
          bit2 = bytes[1].nil? ? 0 : (bytes[1].ord & 0xFF)
          bit3 = bytes[2].nil? ? 0 : (bytes[2].ord & 0xFF)
          result += append3bytes(bit1, bit2, bit3)
        end

        result
      end

      def append3bytes(bit1, bit2, bit3)
        c1 = bit1 >> 2
        c2 = ((bit1 & 0x3) << 4) | (bit2 >> 4)
        c3 = ((bit2 & 0xF) << 2) | (bit3 >> 6)
        c4 = bit3 & 0x3F
        r = ""
        r += encode6bit(c1 & 0x3F).chr
        r += encode6bit(c2 & 0x3F).chr
        r += encode6bit(c3 & 0x3F).chr
        r += encode6bit(c4 & 0x3F).chr
        r
      end

      def encode6bit(bit)
        return ("0".ord + bit).chr if bit < 10

        bit -= 10
        return ("A".ord + bit).chr if bit < 26

        bit -= 26
        return "a#{bit}".chr if bit < 26

        bit -= 26
        return "-" if bit.zero?

        return "_" if bit == 1

        "?"
      end

    end
  end
end
