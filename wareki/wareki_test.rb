require 'minitest/autorun'

require 'wareki'

class Test < Minitest::Test
  def try(s)
    Wareki.string(Date.parse(s))
  end

  def test_normal
    assert_equal '令和2年',  try('2020-12-20')
  end

  def test_edge
    assert_equal '平成元年', try('1989-01-08')
    assert_equal '昭和64年', try('1989-01-07')
  end

  def test_outrange
    assert_raises RangeError do
      try('1001-01-01')
    end
  end
end
