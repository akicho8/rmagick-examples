require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/background/plasma_blur_ex#{index}.png"
end

COUNT = 0
i = 0
c = Color::HSL.from_fraction(1.0.fdiv(COUNT) * i, 0.5, 0.0)
c1 = c.dup.tap { |e| e.luminosity = 10 }
c2 = c.dup.tap { |e| e.luminosity = 50 }
layer = Image.read("plasma:fractal") { |e| e.size = "1920x1080" }.first
d layer.modulate(0.5) # l, s, h


# layer = layer.swirl(180*1)
# layer = layer.implode(1.0)
# layer = layer.blur_image(0, 50)
# layer = layer.wave(25/2, 150)
# d layer
# exit
# layer.write(fn(i.next))


# COUNT = 4
# COUNT.times do |i|
#   c = Color::HSL.from_fraction(1.0.fdiv(COUNT) * i, 0.5, 0.5)
#   c1 = c.dup.tap { |e| e.hue += 0      }
#   c2 = c.dup.tap { |e| e.luminosity    }
#   layer = Image.read("plasma:#{c1.html}-#{c2.html}") { |e| e.size = "1920x1080" }.first
#   # layer = layer.swirl(180*1)
#   # layer = layer.implode(1.0)
#   layer = layer.blur_image(0, 50)
#   # layer = layer.wave(25/2, 150)
#   d layer
#   # exit
#   layer.write(fn(i.next))
# end
