require "./setup"
image = Magick::Image.read("logo:").first
d image.charcoal
