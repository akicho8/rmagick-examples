require "./setup"

# http://kyle-in-jp.blogspot.com/2009_01_11_archive.html
layer1 = Image.read("logo:").first
layer1 = layer1.blur_image(0, 1)
layer2 = layer1.fx("p * 0.7 + rand() * 0.3")
layer2.colorspace = GRAYColorspace
layer3 = layer2.emboss(0, 1)
layer4 = Image.read("gradient:#FFFF1050-#3070A050") { |e| e.size = "#{layer3.columns}x#{layer3.rows}" }.first
d layer3.composite(layer4, 0, 0, OverCompositeOp)
