require "./setup"
image = Image.read("netscape:").first
d image
d image.contrast(false)
d image.contrast(true).contrast(true)
