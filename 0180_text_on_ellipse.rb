require "./setup"

canvas = Magick::Image.read("netscape:").first
canvas.resize!(800, 800)

# この文字にたい
if true
  psize = 32
  gc = Magick::Draw.new
  gc.annotate(canvas, psize, psize, 400, 400, "龍") do |e|
    e.font      = "RictyDiminished-Bold.ttf"
    e.fill      = "white"
    e.pointsize = psize
    e.gravity   = Magick::CenterGravity
  end
end


gc = Magick::Draw.new
gc.fill("rgba(0,0,0,0.3)")
gc.ellipse(400, 400, 100, 50, 0, 360) # x, y, widgh, height, 角度
# gc.circle(400, 400, 410, 400) # x, y, widgh, height, 角度
gc.draw(canvas)




canvas.write("_ellipse.png")
`open _ellipse.png`
