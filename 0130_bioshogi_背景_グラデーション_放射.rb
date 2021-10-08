require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/background/radial_gradiention#{index}.png"
end

COUNT = 4
COUNT.times do |i|
  c = Color::HSL.from_fraction(1.0.fdiv(COUNT) * i, 0.6, 0.7)
  c1 = c.dup.tap { |e| e.luminosity += 0   }
  c2 = c.dup.tap { |e| e.luminosity += -69 }
  layer = Image.read("radial-gradient:#{c1.html}-#{c2.html}") { |e| e.size = "1920x1080" }.first
  d layer
  layer.write(fn(i.next))
end
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210916174521_-_30f07cfb8edf50b7ead13e8c048a90c3.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210916174522_-_caa867805bd73a851e7cf2d5ad3fd51a.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210916174524_-_178d5b22f4a441541ca693a0b94754c6.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210916174525_-_e7fafb77f765ffef5721063675b85696.png
