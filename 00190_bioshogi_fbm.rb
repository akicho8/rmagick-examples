require "./setup"

def hsl(h, s, l)
  h = h.fdiv(360).modulo(1.0)
  Color::HSL.from_fraction(h, s, l).html.sub("#", "").to_i(16)
end

# http://kyle-in-jp.blogspot.com/2008/10/java2djava-image-filterspixels_07.html
def explosion_cm(base)
  s = 0.8
  [
    [  0, 100, hsl(base + 20, s, 0.30), hsl(base + 20, s,0.63)],
    [101, 200, hsl(base + 20, s, 0.63), hsl(base + 60, s,0.69)],
    [201, 255, hsl(base + 60, s, 0.69), hsl(base + 60, s,0.94)],
  ]
end

def cloud_cm(base)
  s = 0.8
  [
    [  0, 201, hsl(base, s, 0.10), hsl(base, s,0.69)],
    [201, 255, hsl(base, s, 0.69), hsl(base, s,0.94)],
  ]
end

[
  { key: "background/explosion_yellow", w: 1920, h: 1080, amount: 1, scale: 200, stretch: 1, angle: 0, color_map: explosion_cm(0),   implode: -0.3, swirl: nil, },
  { key: "background/explosion_blue",   w: 1920, h: 1080, amount: 1, scale: 200, stretch: 1, angle: 0, color_map: explosion_cm(240), implode:  0.3, swirl: nil, },
  { key: "background/cloud_green",      w: 1920, h: 1080, amount: 1, scale: 200, stretch: 1, angle: 0, color_map: cloud_cm(120),     implode: -0.3, swirl: nil, },
  { key: "background/cloud_pink",       w: 1920, h: 1080, amount: 1, scale: 200, stretch: 1, angle: 0, color_map: cloud_cm(326),     implode:  0.3, swirl: nil, },
  { key: "background/cloud_eva0",       w: 1920, h: 1080, amount: 1, scale: 200, stretch: 1, angle: 0, color_map: cloud_cm(40),      implode: -0.3, swirl: nil, },
  { key: "background/cloud_eva1",       w: 1920, h: 1080, amount: 1, scale: 200, stretch: 1, angle: 0, color_map: cloud_cm(268),     implode:  0.3, swirl: nil, },
  # { key: "background/cloud_fire_eva2",   w: 1920, h: 1080, amount: 1, scale: 200, stretch: 1, angle: 0, color_map: explosion_cm(40)  },
  # { key: "board/cloud1",           w: 1080, h: 1080, amount: 1, scale: 100, stretch: 4, angle: 0, color_map: [[0, 255, hsl(38,0.69,0.60), hsl(40,0.69,0.64)]] },
  # { key: "board/cloud2",           w: 1080, h: 1080, amount: 1, scale: 200, stretch: 4, angle: 0, color_map: [[0, 255, hsl(38,0.69,0.60), hsl(35,0.69,0.55)]] },
].each do |e|
  color_map_args = e[:color_map].flatten.join(" ")
  system "./filter/fbm #{e[:w]} #{e[:h]} _output.png #{e[:amount]} #{e[:scale]} #{e[:stretch]} #{e[:angle]} #{e[:color_map].size} #{color_map_args}"
  layer1 = Image.read("_output.png").first
  if v = e[:implode]
    layer1 = layer1.implode(v) # 中央から拡大
  end
  if v = e[:swirl]
    layer1 = layer1.swirl(360*v)
  end
  layer1.write("PNG24:../bioshogi/lib/bioshogi/assets/images/#{e[:key]}.png")
  d layer1
end
# >> /Users/ikeda/src/rmagick-examples/_tmp/20220105184209_-_1f9a201a7f269278ea78ca92767731de.png
