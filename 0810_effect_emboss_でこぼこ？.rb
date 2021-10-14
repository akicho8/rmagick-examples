require "../setup"
layer = Image.read("logo:").first
layer.colorspace = GRAYColorspace
d layer.emboss
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210918194534_-_249f5c9a82d0d44f343a5c9b84ee14f8.png
