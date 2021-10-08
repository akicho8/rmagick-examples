require "./setup"
layer = Image.read("logo:").first
d layer.shave(100, 0)             # => logo:=>/Users/ikeda/src/rmagick-examples/_tmp/20210918210236_-_a34aa33904de3cbe37ec21446fc9faa4.png GIF 640x480=>440x480 440x480+0+0 PseudoClass 256c 8-bit 25kb
d layer.shave(0, 100)             # => logo:=>/Users/ikeda/src/rmagick-examples/_tmp/20210918210236_-_632d13887ce255b478ce60ad8c155214.png GIF 640x480=>640x280 640x280+0+0 PseudoClass 256c 8-bit 18kb
d layer.shave(100, 100)           # => logo:=>/Users/ikeda/src/rmagick-examples/_tmp/20210918210236_-_80cb0d5706f2867760fc2adda686120f.png GIF 640x480=>440x280 440x280+0+0 PseudoClass 256c 8-bit 17kb
