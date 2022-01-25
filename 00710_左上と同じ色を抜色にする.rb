require "./setup"

layer1 = Image.read("logo:").first
layer1 = layer1.matte_replace(0, 0)
d layer1
