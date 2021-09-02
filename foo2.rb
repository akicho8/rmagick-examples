require './setup'
include Magick

# 余白
padx = 10
pady = 10
# 角丸
rx = 20
ry = 20

source = Pathname("~/src/shogi-player/assets/is_bg_variant/wood-texture_00018.png").expand_path
images = ImageList.new(source.to_s)
images.alpha(ActivateAlphaChannel)

images2 = ImageList.new
images2.new_image(images.columns, images.rows){
  self.background_color = "none"
}
dr = Draw.new
dr.fill = "white"
dr.roundrectangle(padx,pady, images.columns-1-padx, images.rows-1-pady, rx, ry)
dr.draw(images2);
# 描画した角丸四角で切り取り
img = images.composite(images2, 0, 0, DstInCompositeOp);

# 角丸四角図形を立体的にする
img2 = images2.shade(true,135,23)
img2 = img2.blur_channel(0, 3, ChannelType::AllChannels).normalize().contrast(true).contrast(true)

# overlayで重ね合わせ
img = img.composite(img2, 0, 0, OverlayCompositeOp)
display img
