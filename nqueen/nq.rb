def main
  n = (ARGV[0] || "8").to_i

  queens = []
  try(queens, n, 0)
end

def try(queens, n, y)
  if n == y
    print_result(queens, n)
    return
  end

  n.times do |x|
    if !takeable(queens, x, y)
      queens.push([ x, y ])
      try(queens, n, y + 1)
      queens.pop
    end
  end
end

def takeable(queens, x, y)
  queens.each do |xn, yn|
    return true if xn == x || yn == y || xn - x == yn - y || xn - x == y - yn
  end
  return false
end

def print_result(queens, n)
  board = []
  n.times do
    board.push(["."] * n)
  end
  queens.each do |x, y|
    board[y][x] = "Q"
  end
  puts board.map{|row| row.join(" ") }.join("\n")
  puts "-" * n * 2
end

main
