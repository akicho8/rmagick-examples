require "./setup"
layer = Image.read("logo:").first
# layer.fuzz = 50
d layer.opaque("white", "red")
