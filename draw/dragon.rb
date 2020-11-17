#!/usr/bin/env ruby -I.

require "my_png"

# https://ja.wikipedia.org/wiki/ドラゴン曲線

def dragon(png, xs, ys, xe, ye, c, lv = 0, m = 1)
  if lv == 0
    png.line(xs, ys, xe, ye, c)
    return
  end

  dx = (xe - xs) * 0.7071
  dy = (ye - ys) * 0.7071

  x1 = xs + (dx - dy * m) * 0.7071
  y1 = ys + (dx * m + dy) * 0.7071

  dragon(png, xs, ys, x1, y1, c, lv - 1, 1)
  dragon(png, x1, y1, xe, ye, c, lv - 1, -1)
end

LIGHTGRAY = [ 211, 211, 211 ]
BLUE = [ 0, 0, 255 ]

png = MyPNG.new(1000, 1000, color: LIGHTGRAY)
dragon(png, 750, 500, 150, 800, BLUE, 17)
dragon(png, 800, 800, 550, 850, BLUE, 9)
dragon(png, 350, 200, 50, 200, BLUE, 5)
png.save('dragon.png')
