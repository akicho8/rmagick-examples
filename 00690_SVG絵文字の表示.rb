require "./setup"

layer1 = Image.new(640, 480) { |e| e.background_color = "white" }
layer2 = Image.read("https://twemoji.maxcdn.com/v/latest/svg/1f9e1.svg").first
layer2 = layer2.matte_replace(0, 0)
layer3 = layer1.composite(layer2, 0, 0, OverCompositeOp)
d layer3
# >> /Users/ikeda/src/rmagick-examples/_tmp/20220125144253_-_0230f8b44bdef56fb122c1bcad302854.png
