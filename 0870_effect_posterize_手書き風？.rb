require "../setup"
layer = Image.read("logo:").first
d layer.posterize(4)
d layer.posterize(4, true)
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210918204700_-_5f43dc817337635b93249743db13c216.png
