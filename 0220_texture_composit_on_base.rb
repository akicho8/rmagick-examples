require "./setup"
base = Image.read("netscape:").first.resize(800, 600)
texture = Image.read("logo:").first.resize_to_fill(400, 300)
d base.composite(texture, CenterGravity, 0, 0, OverCompositeOp)
d base.composite(texture, base.columns / 2 - texture.columns / 2, base.rows / 2 - texture.rows / 2, OverCompositeOp)
