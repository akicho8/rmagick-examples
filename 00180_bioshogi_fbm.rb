require "./setup"

def hsl(h, s, l)
  Color::HSL.from_fraction(h / 360.0, s, l).html.sub("#", "").to_i(16)
end

# http://kyle-in-jp.blogspot.com/2008/10/java2djava-image-filterspixels_07.html
def fire_color_map
  [
    [  0, 100, hsl(20, 1.0,0.0 ), hsl(20,1.0,0.63)],
    [101, 200, hsl(20, 1.0,0.63), hsl(60,1.0,0.69)],
    [201, 255, hsl(60, 1.0,0.69), hsl(60,1.0,0.94)],
  ]
end

[
  { key: "background/cloud_fire1", w: 1080, h: 1080, amount: 1, scale: 200, stretch: 1, angle: 0, color_map: fire_color_map },
  { key: "board/cloud1",           w: 1080, h: 1080, amount: 1, scale: 100, stretch: 4, angle: 0, color_map: [[0, 255, hsl(38,0.69,0.60), hsl(40,0.69,0.64)]] },
  { key: "board/cloud2",           w: 1080, h: 1080, amount: 1, scale: 200, stretch: 4, angle: 0, color_map: [[0, 255, hsl(38,0.69,0.60), hsl(35,0.69,0.55)]] },
].each do |e|
  color_map_args = e[:color_map].flatten.join(" ")
  system "./filter/fbm #{e[:w]} #{e[:h]} _output.png #{e[:amount]} #{e[:scale]} #{e[:stretch]} #{e[:angle]} #{e[:color_map].size} #{color_map_args}"
  layer1 = Image.read("_output.png").first
  layer1.write("PNG24:../bioshogi/lib/bioshogi/assets/images/#{e[:key]}.png")
  d layer1
end
# >> /Users/ikeda/src/rmagick-examples/_tmp/20220105184209_-_1f9a201a7f269278ea78ca92767731de.png
