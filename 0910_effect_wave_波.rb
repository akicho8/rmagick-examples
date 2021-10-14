require "../setup"
layer = Image.read("logo:").first
d layer.wave(25, 150)           # default
d layer.wave(25/2, 150)
