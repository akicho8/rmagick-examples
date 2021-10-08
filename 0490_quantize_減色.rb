require "./setup"
layer = Image.read("netscape:").first
d layer.quantize(256)
d layer.quantize(128)
d layer.quantize(64)
d layer.quantize(32)
d layer.quantize(16)
d layer.quantize(8)
d layer.quantize(4)
d layer.quantize(2)
d layer.quantize(1)
