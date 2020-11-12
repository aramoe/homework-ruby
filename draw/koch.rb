#!/usr/bin/env ruby -I.

require "simple_png"
require "algorithm_draw"

class MyPNG < SimplePNG
  def line(xs, ys, xe, ye, c)
    Algorithm::Draw::line(xs, ys, xe, ye).each do |x, y|
      self[x, y] = c
    end
  end
end


# https://ja.wikipedia.org/wiki/コッホ曲線

def koch(png, xs, ys, xe, ye, c, lv = 0)
  if lv == 0
    png.line(xs, ys, xe, ye, c)
    return
  end

  dx = (xe - xs) / 3.0
  dy = (ye - ys) / 3.0

  x1 = xs + dx
  y1 = ys + dy
  x2 = x1 + dx * 0.5 - dy * 0.866
  y2 = y1 + dx * 0.866 + dy * 0.5
  x3 = x1 + dx
  y3 = y1 + dy

  koch(png, xs, ys, x1, y1, c, lv - 1)
  koch(png, xs, ys, x1, y1, c, lv - 1)
  koch(png, x1, y1, x2, y2, c, lv - 1)
  koch(png, x2, y2, x3, y3, c, lv - 1)
  koch(png, x3, y3, xe, ye, c, lv - 1)
end

LIGHTGRAY = [ 211, 211, 211 ]
BLUE = [ 0, 0, 255 ]

png = MyPNG.new(1000, 500, color: LIGHTGRAY)
koch(png, 990, 490, 10, 100, BLUE, 5)
png.save('koch.png')
