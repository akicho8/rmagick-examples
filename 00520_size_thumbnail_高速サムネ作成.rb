require "./setup"
layer = Image.read("logo:").first
d layer.thumbnail(0.5)
d layer.thumbnail(160, 120)
