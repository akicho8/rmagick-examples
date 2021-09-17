require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/background/gradiention#{index}.png"
end

COUNT = 4
COUNT.times do |i|
  c = Color::HSL.from_fraction(1.0.fdiv(COUNT) * i, 1.0, 0.7)
  c1 = c.dup.tap { |e| e.hue += 0      }
  c2 = c.dup.tap { |e| e.hue += 30 * 4 }
  layer = Image.new(1280, 720)
  gf = GradientFill.new(0, 0, 0, 0, c1.html, c2.html)
  gf.fill(layer)
  d layer
  layer.write(fn(i.next))
end
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210916141108_-_26bf59d370c21b3b6137739ab9ab0bc6.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210916141111_-_7c902188424a757d1b1f57a307c4511b.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210916141113_-_6c58263534b232cdff697e11ad9b8c6c.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210916141115_-_f39053f11e9025e443478fbed6b7173a.png
