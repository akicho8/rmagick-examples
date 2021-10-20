require "./setup"
layer1 = Image.read("netscape:").first
layer1 = layer1.blur_image(0, 10)
d layer1
d layer1.unsharp_mask(0, 1.0, 1.0, 0.05)
