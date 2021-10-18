require "./setup"
# http://kyle-in-jp.blogspot.com/2009/03/rmagick_09.html

image1 = Image.read("logo:").first.resize(800, 600)

image2 = Image.new(image1.columns, image1.rows) { |e| e.background_color = "black" }
image2.alpha(ActivateAlphaChannel)

gc = Draw.new
gc.fill = "white"
gc.ellipse(400, 300, 200, 200, 0, 360)
gc.draw(image2)

image2 = image2.negate(true)
image2 = image2.fx("r", AlphaChannel) # これはなに？
image2 = image2.fx("#00F", DefaultChannels)
image2.background_color = "black"
d shadowimg = image2.shadow(3, 3, 3, 0.4)
d img = image1.composite(shadowimg, 0, 0, OverCompositeOp)
d img.composite(image2, 0, 0, OverCompositeOp)
