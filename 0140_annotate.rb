require "./setup"

canvas = Magick::Image.read("granite:").first
canvas.resize!(200, 200)

char_w = 100

gc = Magick::Draw.new
gc.annotate(canvas, char_w - 1, char_w - 1, 0, 0, "龍") do |e|
  e.font      = "RictyDiminished-Bold.ttf"
  e.fill      = "black"
  e.pointsize = char_w / 2
  e.gravity   = Magick::CenterGravity
end

gc.fill = "rgba(0,0,0,0.5)"
gc.rectangle(0, 0, char_w - 1, char_w - 1)
gc.draw(canvas)

canvas.write("_annotate.png")
`open _annotate.png`
