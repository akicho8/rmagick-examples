require "./setup"
# file:///Users/ikeda/src/rmagick/doc/image3.html#watermark
layer1 = Image.read("logo:").first
layer2 = Image.read("wizard:").first
d layer1.watermark(layer2)                          # 左上
d layer1.watermark(layer2, 1.0, 1.0, CenterGravity) # 中央
d layer1.watermark(layer2, 0.5, 0.5, CenterGravity) # ？
