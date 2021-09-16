require "./setup"
# x1, y1, x2, y2, start_color, stop_color

# 1. Image.new に渡す方法
d Image.new(800, 600, GradientFill.new(0, 0, 0, 0, "blue", "white")) # 青＼白 (左上から右下)
d Image.new(800, 600, GradientFill.new(1, 0, 0, 0, "blue", "white")) # 青↓白
d Image.new(800, 600, GradientFill.new(0, 1, 0, 0, "blue", "white")) # 青→白

# 2. GradientFill#fill(image)
layer = Image.new(800, 600, GradientFill.new(0, 0, 0, 0, "blue", "white"))
gf = GradientFill.new(0, 0, 0, 0, "blue", "white")
gf.fill(layer)
d layer
