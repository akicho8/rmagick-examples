require "./setup"

canvas = Image.read("netscape:").first
canvas.resize!(800, 800)

gc = Draw.new
gc.fill("rgba(0,0,0,0.3)")
gc.rectangle(400, 400, 400+200, 400+100)
gc.draw(canvas)

d canvas
