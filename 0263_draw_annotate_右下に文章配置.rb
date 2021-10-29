require "./setup"

layer1 = Image.new(800, 800) { |e| e.background_color = "white" }

str = "123"
pointsize = 40
w = 98
h = w
x = 0
y = 0
r = 42
layer2 = Image.new(w, h) { |e| e.background_color = "transparent" }

gc = Draw.new
gc.fill("hsla(0,0%,0%,0.9)")
from = [x + w/2, y + h/2]
to   = [x + w/2 + r, y + h/2]
gc.circle(*from, *to)
gc.draw(layer2)

gc = Draw.new
gc.annotate(layer2, w, h, x, y, str) do |e|
  e.font      = "fonts/RictyDiminished-Bold.ttf"
  e.fill      = "hsla(0,0%,100%,0.9)"
  e.pointsize = pointsize
  e.gravity   = CenterGravity
end

d layer1.composite(layer2, NorthGravity, OverCompositeOp)
