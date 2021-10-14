require "./setup"
# |------------------------+----------------|
# | SoftLightCompositeOp   | 濃くなる1      |
# | PegtopLightCompositeOp | 濃くなる2      |
# | OverlayCompositeOp     | 濃くなる3      |
# | ScreenCompositeOp      | 白くなる       |
# | PlusCompositeOp        | かなり白くなる |
# | LinearDodgeCompositeOp | かなり白くなる |
# | DstAtopCompositeOp     | 宇宙の惑星     |
# | ColorDodgeCompositeOp  | かなり白くなる |
# | ColorBurnCompositeOp   | かなり濃くなる |
# | BlendCompositeOp       | かなり白くなる |
# |------------------------+----------------|

# | SoftLightCompositeOp   | 濃くなる1      |
# | PegtopLightCompositeOp | 濃くなる2      |
# | OverlayCompositeOp     | 濃くなる3      |
# | ScreenCompositeOp      | 白くなる       |
# | PlusCompositeOp        | かなり白くなる |
# | LinearDodgeCompositeOp | かなり白くなる |
# | DstAtopCompositeOp     | 宇宙の惑星     |
# | ColorDodgeCompositeOp  | かなり白くなる |
# | ColorBurnCompositeOp   | かなり濃くなる |
# | BlendCompositeOp       | かなり白くなる |

color = Pixel.from_hsla(0, 0, 80).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
layer1 = Image.read(PAKUTASO1).first
layer1 = Image.read("wood_texture/_output15.png").first
layer2 = Image.read("radial-gradient:#{color}-transparent") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first

layer3 = Image.read("plasma:black-black") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first
layer3.colorspace = GRAYColorspace
# layer3 = layer3.blur_image(0, 75)
layer3 = layer3.blur_image(0, 20)

# [ScreenCompositeOp, SoftLightCompositeOp].each do |e|
#   d layer1.composite(layer3, 0, 0, e), e
# end

layer4 = layer1.composite(layer3, 0, 0, SoftLightCompositeOp)
layer4.composite(layer2, 0, 0, ScreenCompositeOp).write("../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture01.png")

# CompositeOperator.values.each do |e|
#   d layer1.composite(layer2, 0, 0, e), e
# end
# d layer1.composite(layer2, 0, 0, Magick.const_get("SoftLightCompositeOp"))

# layer1.composite(layer3, 0, 0, ScreenCompositeOp).write("../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture01.png")
# layer1.composite(layer3, 0, 0, SoftLightCompositeOp).write("../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture02.png")
# layer1.composite(layer2, 0, 0, ScreenCompositeOp).write("../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture03.png")
# layer1.composite(layer2, 0, 0, SoftLightCompositeOp).write("../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture04.png")


# >> /Users/ikeda/src/rmagick-examples/_tmp/20211014082817_-_3abdedbe4532ebe267eff9d7ed771101.png
