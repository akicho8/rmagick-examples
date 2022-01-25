require "./setup"
layer = Image.read("logo:").first
d layer.negate
d layer.negate(true)            # グレースケールの部分だけを反転？
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210918203359_-_4ffffb13cef93ce47effb5ba4fd0c5a3.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210918203359_-_6fd262bb474c0518b6b1ee9beddfa1b9.png
