require "./setup"
layer = Image.read("logo:").first
d layer.ordered_dither("2x2")
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210918204700_-_5f43dc817337635b93249743db13c216.png
