require "./setup"

require "rmagick"
require "pathname"
include Magick

base1 = Image.read("netscape:").first
base1 = base1.resize(800, 600)
# base1.alpha(Magick::ActivateAlphaChannel)

source = Pathname("~/src/shogi-player/assets/is_bg_variant/wood-texture_00018.png").expand_path
tex1 = Image.read(source.to_s).first
tex1 = tex1.resize_to_fill(400, 300)

gc = Draw.new
gc.fill = "white"
gc.roundrectangle(0, 0, tex1.columns - 1, tex1.rows - 1, 20, 20)
gc.draw(tex1)

display tex1

# tex1 = tex1.composite(tex1, tex1.columns / 2 - tex1.columns / 2, tex1.rows / 2 - tex1.rows / 2, Magick::OverCompositeOp)
# display tex1

# img2 = Image.new(tex1.columns, tex1.rows) { |e| e.background_color = "none" }
# tex1.alpha(ActivateAlphaChannel)
# tex1.write("_foo.png")
# `open _foo.png`


# gc = Draw.new
# gc.fill = "white"
# gc.roundrectangle(0, 0, tex1.columns - 1, tex1.rows - 1, 20, 20)
# gc.draw(img2)
# img3 = tex1.composite(img2, 0, 0, DstInCompositeOp)
# 
# # 影を作成
# img3.background_color = "black"
# img4 = img3.shadow(5, 5, 3, 0.4)
# img5 = img4.composite(img3, 0, 0, OverCompositeOp)
# img6 = Image.new(img4.columns, img4.rows) { |e| e.background_color = 'white' }
# img7 = img6.composite(img5, 0, 0, OverCompositeOp)

