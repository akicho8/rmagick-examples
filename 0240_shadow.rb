require "./setup"

layer = Image.new(400, 400) { |e| e.background_color = "transparent" }

gc = Draw.new
gc.fill("white")
gc.circle(200, 200, 250, 200)
gc.draw(layer)

# 全部同じ？
d layer.shadow(-20, -20, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
d layer.shadow(  0,   0, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
d layer.shadow(-10,  10, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
d layer.shadow(-20,  20, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
d layer.shadow(-30,  30, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
