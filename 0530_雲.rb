require "./setup"
layer1 = Image.read("plasma:black-black") { |e| e.size = "1080x1080" }.first
layer1.colorspace = GRAYColorspace
d layer1.blur_image(0, 20)
d layer1.blur_image(0, 30)
d layer1.blur_image(0, 40)
d layer1.blur_image(0, 50)
