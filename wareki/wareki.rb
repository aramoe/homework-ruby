require "date"

class Wareki
  Table = [
    [ '2019-05-01', '令和' ],
    [ '1989-01-08', '平成' ],
    [ '1926-12-25', '昭和' ],
    [ '1912-07-30', '大正' ],
    [ '1868-01-25', '明治' ],
  ]

  class << self
    def calc(date)
      Table.each do |ymd, name|
        d = Date.parse(ymd)
        if d <= date
          y = date.year - d.year + 1
          return [ y, name ]
        end
      end
      raise RangeError
    end

    def string(date)
      y, name = calc(date)
      if y == 1
        sprintf("%s元年", name)
      else
        sprintf("%s%d年", name, y)
      end
    end
  end
end
