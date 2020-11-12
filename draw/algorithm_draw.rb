module Algorithm
  module Draw
    class << self

      # https://ja.wikipedia.org/wiki/ブレゼンハムのアルゴリズム
      def line(x, y, xe, ye)
        x, y, xe, ye = [ x, y, xe, ye ].map(&:to_i)

        dx, dy = xe - x, ye - y
        sx, sy = 1, 1
        dx, sx = -dx, -sx if dx < 0
        dy, sy = -dy, -sy if dy < 0

        p = [ [ x, y ] ]

        e = dx - dy
        while !(x == xe && y == ye)
          e2 = e * 2
          if e2 > -dy
            e -= dy
            x += sx
          end
          if e2 < dx
            e += dx
            y += sy
          end
          p << [ x, y ]
        end

        return p
      end
    end
  end
end
