require "./setup"

canvas = Magick::Image.read("netscape:").first
canvas.resize!(800, 800)

gc = Magick::Draw.new
gc.fill("rgba(0,0,0,0.3)")
gc.circle(400, 400, 800, 400) # cx, cy, rx, ry (cy == ry でいいっぽい)
gc.draw(canvas)

canvas.write("_circle.png")
`open _circle.png`
