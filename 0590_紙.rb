require "./setup"

# http://kyle-in-jp.blogspot.com/2009/02/imagemagick.html
layer = Image.read("plasma:fractal") { |e| e.size = "800x600" }.first
layer.colorspace = GRAYColorspace
layer = layer.fx("p*0.2+0.8")
layer = layer.spread(20)
d layer
