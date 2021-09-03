require "./setup"

texture = Image.read("logo:").first.resize(256, 256)

mask = Image.new(texture.columns, texture.rows) { |e| e.background_color = "transparent" }
gc = Draw.new
gc.stroke("none")
gc.stroke_width(0)
gc.fill("white") # 色がついていれば何でもよい
gc.roundrectangle(0, 0, mask.columns - 1, mask.rows - 1, 50, 50)
gc.draw(mask)
d mask

d texture = texture.composite(mask, 0, 0, CopyAlphaCompositeOp)

room = Image.read("netscape:").first.resize(640, 480)
d room.composite(texture, CenterGravity, 0, 0, OverCompositeOp)
