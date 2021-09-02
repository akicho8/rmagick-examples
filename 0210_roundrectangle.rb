require "./setup"

canvas = Magick::Image.read("netscape:").first
canvas.resize!(800, 800)

gc = Magick::Draw.new
gc.fill("rgba(0,0,0,0.3)")
gc.roundrectangle(400, 400, 400+200, 400+100, 16, 16)
gc.draw(canvas)

d canvas
