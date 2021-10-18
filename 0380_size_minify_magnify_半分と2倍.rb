require "./setup"
layer = Image.read("logo:").first
layer.minify                    # => logo:=>LOGO GIF 640x480=>320x240 320x240+0+0 DirectClass 8-bit
layer.magnify                   # => logo:=>LOGO GIF 640x480=>1280x960 1280x960+0+0 DirectClass 8-bit
