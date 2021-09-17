require "./setup"

layer = Image.read("netscape:").first
layer.resize!(800, 800)

gc = Draw.new
gc.fill_pattern = Image.read("logo:").first
gc.fill_opacity(0.5)
gc.circle(400, 400, 600, 400)
gc.draw(layer)

d layer
