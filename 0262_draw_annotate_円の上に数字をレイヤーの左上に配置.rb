require "./setup"

layer1 = Image.new(1920, 1080) { |e| e.background_color = "white" }

str = "BGM: SONG-NAME written by author-name"
pointsize = 32
w = layer1.columns
h = pointsize
margin_x = 8
margin_y = 6
layer2 = Image.new(w, h) { |e| e.background_color = "transparent" }

gc = Draw.new
gc.annotate(layer2, w, h, 0, 0, str) do |e|
  e.font      = "fonts/RictyDiminished-Bold.ttf"
  e.fill      = "hsla(0,0%,0%,1.0)"
  e.pointsize = pointsize
  e.gravity   = SouthEastGravity
end

d layer1.composite(layer2, SouthEastGravity, margin_x, margin_y, OverCompositeOp)
