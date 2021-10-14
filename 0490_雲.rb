require "./setup"
layer = Image.read("plasma:black-black") { |e| e.size = "1080x1080" }.first
layer.colorspace = GRAYColorspace
d layer.blur_image(0, 20)
d layer.blur_image(0, 30)
d layer.blur_image(0, 40)
d layer.blur_image(0, 50)
