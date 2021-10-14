require "./setup"
color = Pixel.from_hsla(0, 0, 80).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
layer1 = Image.read(PAKUTASO1).first
layer1 = Image.read("wood_texture/_output15.png").first
layer2 = Image.read("radial-gradient:#{color}-transparent") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first

# CompositeOperator.values.each do |e|
#   d layer1.composite(layer2, 0, 0, e), e
# end
d layer1.composite(layer2, 0, 0, Magick.const_get("SoftLightCompositeOp"))

# layer1.composite(layer2, 0, 0, Magick::ScreenCompositeOp).write("../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture01.png")
# >> /Users/ikeda/src/rmagick-examples/_tmp/20211014082817_-_3abdedbe4532ebe267eff9d7ed771101.png
