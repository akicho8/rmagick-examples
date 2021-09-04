require "./setup"

layer = Image.new(800, 600) { |e| e.background_color = "transparent" }

gc = Draw.new
gc.translate(layer.columns * 0.25, layer.rows * 0.25)
gc.fill = "white"
gc.gravity = CenterGravity
gc.rectangle(0, 0, layer.columns * 0.5, layer.rows * 0.5)
gc.draw(layer)

# 何も変わらない
d layer.shadow(  0,  0, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
d layer.shadow(-10, 10, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
d layer.shadow(-20, 20, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
d layer.shadow(-30, 30, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
