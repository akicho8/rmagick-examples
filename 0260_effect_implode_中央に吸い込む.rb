require "./setup"
layer = Image.read("logo:").first
d layer.implode(0.1)
d layer.implode(0.2)
d layer.implode(0.4)
d layer.implode(0.8)
d layer.implode(1.0)
