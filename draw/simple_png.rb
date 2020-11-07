# https://mametter.hatenablog.com/entry/20091003/p1

require "zlib"

class SimplePNG
  attr_reader :width, :height

  def initialize(width = 100, height = 100, color: [0, 0, 0])
    @width = width
    @height = height
    @map = (0...height).map{ [color] * width }
  end

  def [](x, y)
    in_range?(x, y) ? @map[y][x] : nil
  end

  def []=(x, y, c)
    in_range?(x, y) ? (@map[y][x] = c) : nil
  end

  def in_range?(x, y)
    0 <= x && x < @width && 0 <= y && y < @height
  end

  def save(path)
    open(path, 'wb') do |f|
      f.write(format)
    end
  end

  def format
    "\x89PNG\r\n\x1a\n".b +
    chunk("IHDR", [@width, @height, 8, 2, 0, 0, 0].pack("NNCCCCC")) +
    chunk("IDAT", Zlib::Deflate.deflate(@map.map{|line| ([0] + line.flatten).pack('C*') }.join)) +
    chunk("IEND", "")
  end

  private

  def chunk(type, data)
    [data.bytesize, type, data, Zlib.crc32(type + data)].pack("NA4A*N")
  end
end
