# BASE + BALL = GAMES

def put_answer(b, a, s, e, l, g, m)
  puts "b=#{b} a=#{a} s=#{s} e=#{e} l=#{l} g=#{g} m=#{m}"
  puts ""
  puts "  #{b}#{a}#{s}#{e}"
  puts "+ #{b}#{a}#{l}#{l}"
  puts "------"
  puts " #{g}#{a}#{m}#{e}#{s}"
  puts ""
end

def assign_ok(b, a, s, e, l, g, m)
  return false if b == 0
  return true
end

def calc_ok(b, a, s, e, l, g, m)
  base = b * 1000  +  a * 100  +  s * 10  +  e
  ball = b * 1000  +  a * 100  +  l * 10  +  l
  games = g * 10000  +  a * 1000  +  m * 100  +  e * 10  +  s
  return base + ball == games
end

g = 1
l = 5
[ 0, 2, 3, 4, 6, 7, 8, 9 ].combination(5) do |c|
  c.permutation do |b, a, s, e, m|
    p = [ b, a, s, e, l, g, m ]
    if assign_ok(*p)
      if calc_ok(*p)
        put_answer(*p)
      end
    end
  end
end
