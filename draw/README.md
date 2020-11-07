# グラフィック

カレントディレクトリに simple\_png.rb を置いて

```
#!/usr/bin/env ruby -I.

require "simple_png"

WHITE = [ 255, 255, 255 ]  # RGB
BLUE = [ 0, 0, 255 ]

png = SimplePNG.new(11, 11, color: WHITE)  # 広さ、背景
png[5, 5] = BLUE  # まんなかに青
png.save("blue-dot.png")  # 画像ファイルを作成
```

いろいろな模様を描いてみる
