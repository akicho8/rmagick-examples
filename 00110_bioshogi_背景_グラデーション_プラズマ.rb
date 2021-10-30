# -*- compile-command: "ruby 0110_bioshogi_背景_グラデーション_プラズマ.rb && cd ~/src/bioshogi/experiment/image_renderer && ruby 0240_color_theme.rb" -*-

require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/background/plasma_blur#{index}.png"
end

COUNT = 4
COUNT.times do |i|
  c = Color::HSL.from_fraction(1.0.fdiv(COUNT) * i, 0.5, 0.7)
  c1 = c.dup.tap { |e| e.hue += 0      }
  c2 = c.dup.tap { |e| e.luminosity    }
  layer1 = Image.read("plasma:#{c1.html}-#{c2.html}") { |e| e.size = "1920x1080" }.first
  # layer = layer.swirl(180*1)
  # layer = layer.implode(1.0)
  layer1 = layer1.blur_image(0, 75)
  d layer1
  # layer = layer.wave(25/2, 150)
  # exit
  layer1.write(fn(i.next))
end
