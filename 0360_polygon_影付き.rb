require "./setup"

canvas = Image.read("netscape:").first.resize(800, 600)

object_layer = Image.new(canvas.columns, canvas.rows) { |e| e.background_color = "transparent" } # 物の層

gc = Draw.new
gc.stroke_width(3)
gc.stroke("white")
gc.fill("rgba(255,255,255,0.5)")
gc.polygon(400, 200, 300, 400, 500, 400) # 最低3点必要
gc.draw(object_layer)

d shadow_layer = object_layer.shadow(3, 3, 3, 0.4)                           # 影
d object_layer = shadow_layer.composite(object_layer, 0, 0, OverCompositeOp) # 物' = (影 + 物)
d canvas.composite(object_layer, 0, 0, OverCompositeOp)                      # 背景 + 物'
