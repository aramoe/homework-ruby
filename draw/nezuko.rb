#!/usr/bin/env ruby -I.

require "my_png"

MAG = 30
PINK = [ 0xFF, 0x66, 0x99 ]
BLACK = [ 0, 0, 0 ]

png = MyPNG.new(500, 500, color: PINK)

xz, yz = 0, -50
10.times do
  x0, y0 = xz, yz
  15.times do
    x1, y1 = x0 + MAG, y0
    x2, y2 = x1 + MAG, y0
    x3, y3 = x2 + MAG, y0
    x4, y4 = x0 + MAG * 1.5, y0 - MAG * 0.866
    x5, y5 = x0 + MAG * 1.5, y0 + MAG * 0.866

    png.line(x0, y0, x1, y1, BLACK)
    png.line(x0, y0, x4, y4, BLACK)
    png.line(x1, y1, x4, y4, BLACK)
    png.line(x4, y4, x2, y2, BLACK)
    png.line(x4, y4, x3, y3, BLACK)
    png.line(x2, y2, x3, y3, BLACK)
    png.line(x4, y4, x5, y5, BLACK)
    png.line(x1, y1, x5, y5, BLACK)
    png.line(x2, y2, x5, y5, BLACK)

    x0, y0 = x5, y5
  end
  xz -= MAG * 1.5
  yz += MAG * 0.866
end

png.save('nezuko.png')
