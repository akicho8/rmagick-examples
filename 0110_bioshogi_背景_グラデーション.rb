require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/background/gradiention#{index}.png"
end

COUNT = 4
COUNT.times do |i|
  c = Color::HSL.from_fraction(1.0.fdiv(COUNT) * i, 1.0, 0.7)
  c1 = c.dup.tap { |e| e.hue += 0      }
  c2 = c.dup.tap { |e| e.hue += 30 * 4 }
  layer = Image.new(1920, 1080)
  gf = GradientFill.new(0, 0, 0, 0, c1.html, c2.html)
  gf.fill(layer)
  d layer
  layer.write(fn(i.next))
end
