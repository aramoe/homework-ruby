# 順列組み合わせのメソッドを使った

def put_answer(s, e, n, d, m, o, r, y)
  puts "s=#{s} e=#{e} n=#{n} d=#{d} m=#{m} o=#{o} r=#{r} y=#{y}"
  puts ""
  puts "  #{s}#{e}#{n}#{d}"
  puts "+ #{m}#{o}#{r}#{e}"
  puts "------"
  puts " #{m}#{o}#{n}#{e}#{y}"
  puts ""
end

def assign_ok(s, e, n, d, m, o, r, y)
  if n != e + 1
    return false
  end

  return true
end

def calc_ok(s, e, n, d, m, o, r, y)
  send = s * 1000  +  e * 100  +  n * 10  +  d
  more = m * 1000  +  o * 100  +  r * 10  +  e
  money = m * 10000  +  o * 1000  +  n * 100  +  e * 10  +  y
  return send + more == money
end

m = 1
s = 9
o = 0
(2..8).to_a.combination(5) do |c|
  c.permutation do |e, n, d, r, y|
    p = [ s, e, n, d, m, o, r, y ]
    if assign_ok(*p)
      if calc_ok(*p)
        put_answer(*p)
      end
    end
  end
end
