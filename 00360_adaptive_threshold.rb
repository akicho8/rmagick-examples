require "./setup"
layer = Image.read("logo:").first
d layer.adaptive_threshold
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210918195130_-_6e850ef524d68eacf2bd91d443705682.png
