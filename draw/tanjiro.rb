#!/usr/bin/env ruby -I.

require "simple_png"

MAG = 10
GREEN = [ 0, 255, 0 ]

png = SimplePNG.new

100.times do |y|
  100.times do |x|
    if (x / MAG) % 2 == (y / MAG) % 2
      png[x, y] = GREEN
    end
  end
end

png.save('tanjiro.png')
