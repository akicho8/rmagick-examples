require "./setup"

layer = Image.read("netscape:").first
layer.resize!(800, 800)

gc = Draw.new
gc.fill("rgba(0,0,0,0.3)")
# https://rmagick.github.io/draw.html#circle
gc.circle(400, 400, 800, 400) # cx, cy, rx, ry (cy == ry でいいっぽい)
gc.draw(layer)

d layer
