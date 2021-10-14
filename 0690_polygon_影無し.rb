require "./setup"

canvas = Image.read("netscape:").first.resize(800, 600)

gc = Draw.new
gc.stroke_width(3)
gc.stroke("white")
gc.fill("rgba(255,255,255,0.5)")
gc.polygon(400, 200, 300, 400, 500, 400) # 最低3点必要
gc.draw(canvas)

d canvas
