require "./setup"

layer = Image.read("plasma:fractal") { |e| e.size = "400x400" }.first
d layer
d layer.extent(layer.columns*0.5, layer.rows*0.5, layer.columns*0.25, layer.rows*0.25) # => plasma:fractal=>/Users/ikeda/src/rmagick-examples/_tmp/20210919150653_-_bb00da1603c4b8e7b9bb2915605f6c11.png GRADIENT 400x400=>200x200 200x200+0+0 DirectClass 16-bit 209kb
d layer.crop(layer.columns*0.25, layer.rows*0.25, layer.columns*0.5, layer.rows*0.5, true) # => plasma:fractal=>/Users/ikeda/src/rmagick-examples/_tmp/20210919150653_-_6b94e42cd9a96591287ffd20ddeec871.png GRADIENT 400x400=>200x200 DirectClass 16-bit 209kb
d layer.crop(CenterGravity, layer.columns*0.5, layer.rows*0.5, true) # => plasma:fractal=>/Users/ikeda/src/rmagick-examples/_tmp/20210919150653_-_8b36a3047da3103f11231cbe4190a719.png GRADIENT 400x400=>200x200 DirectClass 16-bit 209kb
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210919150653_-_8f22a71f861444db9e91360532dfde6d.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210919150653_-_bb00da1603c4b8e7b9bb2915605f6c11.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210919150653_-_6b94e42cd9a96591287ffd20ddeec871.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20210919150653_-_8b36a3047da3103f11231cbe4190a719.png
