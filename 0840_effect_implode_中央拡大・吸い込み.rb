require "./setup"
layer = Image.read("logo:").first
d layer.implode(-1.0)           # 拡大
d layer.implode(0.5)
