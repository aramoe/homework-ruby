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
