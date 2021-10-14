require "./setup"

Pixel.new(0,0,255,128).to_hsla                       # => [240.0, 255.0, 0.4961089494163424, 0.001953154802777142]
Pixel.from_color("blue").to_hsla                     # => [240.0, 255.0, 127.5, 1.0]
Pixel.from_color("#0000ff88").to_hsla                # => [240.0, 255.0, 127.5, 0.5333333333333333]
Pixel.from_color("hsla(90,90,90,0.25)").to_hsla      # => [89.99999999999999, 89.99999873338197, 89.99999999999999, 0.25]
Pixel.from_hsla("25%", "25%", "25%", "25%").to_hsla  # => [90.00000357073016, 63.79999536632217, 63.800000379985406, 0.2]
Pixel.from_hsla(90, 90, 90, 0.25).to_hsla            # => [89.99999999999999, 89.99999873338197, 89.99999999999999, 0.2]
Pixel.from_hsla(90, 90, 90, 0.25).to_color           # => "#5A5A7A3E3A76"
Pixel.from_hsla(0, 0, 255).to_color                  # => "gray98"

# to_color
Pixel.from_color("blue").to_color(AllCompliance, true,  8, true)  # => "#0000FFFF"
Pixel.from_color("blue").to_color(AllCompliance, false, 8, true)  # => "#0000FF"
Pixel.from_color("blue").to_color(AllCompliance, false, 8, false) # => "blue"

# 明るさ
Pixel.from_color("black").intensity                  # => 0
Pixel.from_color("blue").intensity                   # => 7471
Pixel.from_color("yellow").intensity                 # => 58064
Pixel.from_color("white").intensity                  # => 65535

# 怪しい仕様
# alphaの小数第2位は6で繰り上げ？
Pixel.from_hsla(90, 90, 90, 0.25).to_hsla            # => [89.99999999999999, 89.99999873338197, 89.99999999999999, 0.2]
Pixel.from_hsla(90, 90, 90, 0.26).to_hsla            # => [89.99999999999999, 89.99999873338197, 89.99999999999999, 0.3]
