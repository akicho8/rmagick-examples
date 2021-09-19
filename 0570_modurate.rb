require "./setup"
image = Image.read("logo:").first
image.modulate(1.0, 1.0, 1.0) # LSHの順。1.0 では何も変化しない
d image.modulate(1.0, 1.0, 0.1)
