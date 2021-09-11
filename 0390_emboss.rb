require "./setup"
layer1 = Image.read("logo:").first
layer1 = layer1.fx("p * 0.7 + rand() * 0.3")
layer1.colorspace = GRAYColorspace
d layer1.emboss(0, 1)
