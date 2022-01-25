require "./setup"

# crop(x, y, w, h)
# crop(gravity, x, y, w, h)
# crop(gravity, w, h)
# 最後に true をつけると元凶の offset を外せる

layer = Image.read("logo:") { |e| e.size = "800x800" }.first

# 中央切り取り
layer.crop(CenterGravity, 200, 200)       # => logo:=>LOGO GIF 640x480=>200x200 640x480+220+140 PseudoClass 256c 8-bit
layer.crop(CenterGravity, 200, 200, true) # => logo:=>LOGO GIF 640x480=>200x200 PseudoClass 256c 8-bit
