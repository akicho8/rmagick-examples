require "./setup"
layer = Image.read("logo:").first
d layer.median_filter(10)
