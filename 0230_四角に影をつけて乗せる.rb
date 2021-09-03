require "./setup"

canvas = Image.read("logo:").first.resize(800, 600) # 単なる背景

object_layer = Image.new(canvas.columns, canvas.rows) { |e| e.background_color = "transparent" } # 物の層

# なんでもいいの書く
gc = Draw.new
gc.translate(canvas.columns * 0.25, canvas.rows * 0.25)
gc.fill = "blue"
gc.gravity = CenterGravity
gc.rectangle(0, 0, canvas.columns * 0.5, canvas.rows * 0.5)
gc.draw(object_layer)

d shadow_layer = object_layer.shadow(3, 3, 3, 0.4)                           # 影
d object_layer = shadow_layer.composite(object_layer, 0, 0, OverCompositeOp) # 物' = (影 + 物)
d canvas.composite(object_layer, 0, 0, OverCompositeOp)                      # 背景 + 物'
