require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/background/plasma_blur#{index}.png"
end

COUNT = 6
COUNT.times do |i|
  c = Color::HSL.from_fraction(1.0.fdiv(COUNT) * i, 0.7, 0.8)
  c1 = c.dup.tap { |e| e.hue += 0      }
  c2 = c.dup.tap { |e| e.luminosity    }
  layer = Image.read("plasma:#{c1.html}-#{c2.html}") { |e| e.size = "1280x720" }.first
  layer = layer.blur_image(0, 50)
  d layer
  layer.write(fn(i.next))
end
