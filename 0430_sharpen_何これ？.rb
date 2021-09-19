require "./setup"
layer = Image.read("logo:").first
d layer.sharpen(0, 5)           # 何が変わる？
