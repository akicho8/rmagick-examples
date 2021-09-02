require "./setup"

canvas = Image.read("netscape:").first
canvas.resize!(800, 800)

gc = Draw.new
gc.fill("rgba(0,0,0,0.3)")
gc.ellipse(400, 400, 200, 100, 0, 360) # x, y, w, h, angle(0 to 360)
gc.draw(canvas)

d canvas
