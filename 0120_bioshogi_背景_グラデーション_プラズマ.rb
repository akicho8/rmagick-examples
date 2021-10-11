require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/background/plasma_blur#{index}.png"
end

COUNT = 4
COUNT.times do |i|
  c = Color::HSL.from_fraction(1.0.fdiv(COUNT) * i, 0.7, 0.7)
  c1 = c.dup.tap { |e| e.hue += 0      }
  c2 = c.dup.tap { |e| e.luminosity    }
  layer = Image.read("plasma:#{c1.html}-#{c2.html}") { |e| e.size = "1920x1080" }.first
  layer = layer.blur_image(0, 50)
  # layer = layer.swirl(180*2)
  # layer = layer.wave(25/2, 150)
  d layer
  layer.write(fn(i.next))
end
