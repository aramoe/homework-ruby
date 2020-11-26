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
  # 最上位桁は0ではないこと
  if s == 0 || m == 0
    return false
  end

  # 数が重複しないこと
  count = [0] * 10
  [s, e, n, d, m, o, r, y].each do |x|
    if count[x] > 0
      return false
    end
    count[x] += 1
  end

  return true
end

def calc_ok(s, e, n, d, m, o, r, y)
  send = s * 1000  +  e * 100  +  n * 10  +  d
  more = m * 1000  +  o * 100  +  r * 10  +  e
  money = m * 10000  +  o * 1000  +  n * 100  +  e * 10  +  y
  return send + more == money
end

(0..9).each do |s|
  (0..9).each do |e|
    (0..9).each do |n|
      (0..9).each do |d|
        (0..9).each do |m|
          (0..9).each do |o|
            (0..9).each do |r|
              (0..9).each do |y|
                if assign_ok(s, e, n, d, m, o, r, y)
                  if calc_ok(s, e, n, d, m, o, r, y)
                    put_answer(s, e, n, d, m, o, r, y)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
