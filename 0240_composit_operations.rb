require "./setup"

color = Pixel.from_hsla(0, 0, 255).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
layer1 = Image.read(PAKUTASO1).first
layer2 = Image.read("radial-gradient:#{color}-transparent") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first

CompositeOperator.values.each do |e|
  layer1.composite(layer2, 0, 0, e).to_file("operators/#{e}")
end
# d layer1.composite(layer2, 0, 0, Magick::OverCompositeOp)
# >> /Users/ikeda/src/rmagick-examples/_tmp/20211014082817_-_3abdedbe4532ebe267eff9d7ed771101.png

# file = Pathname("images/matrix_1024x768.png")
# layer1 = Image.read(file).first
#
# layer2 = Image.read(file).first
# layer2.colorspace = GRAYColorspace
# layer2 = layer2.spread(4).blur_image(0, 2)
#
# tp CompositeOperator.values
#
# CompositeOperator.values.each do |e|
#   layer1.composite(layer2, 0, 0, e).to_file("operators/#{e}")
# end
`open _operators`
# >> |-----------------------------|
# >> | AtopCompositeOp             |
# >> | BlendCompositeOp            |
# >> | BlurCompositeOp             |
# >> | BumpmapCompositeOp          |
# >> | ChangeMaskCompositeOp       |
# >> | ClearCompositeOp            |
# >> | ColorBurnCompositeOp        |
# >> | ColorDodgeCompositeOp       |
# >> | ColorizeCompositeOp         |
# >> | CopyBlackCompositeOp        |
# >> | CopyBlueCompositeOp         |
# >> | CopyCompositeOp             |
# >> | CopyCyanCompositeOp         |
# >> | CopyGreenCompositeOp        |
# >> | CopyMagentaCompositeOp      |
# >> | CopyRedCompositeOp          |
# >> | CopyYellowCompositeOp       |
# >> | DarkenCompositeOp           |
# >> | DarkenIntensityCompositeOp  |
# >> | DistortCompositeOp          |
# >> | DivideDstCompositeOp        |
# >> | DivideSrcCompositeOp        |
# >> | DstAtopCompositeOp          |
# >> | DstCompositeOp              |
# >> | DstInCompositeOp            |
# >> | DstOutCompositeOp           |
# >> | DstOverCompositeOp          |
# >> | DifferenceCompositeOp       |
# >> | DisplaceCompositeOp         |
# >> | DissolveCompositeOp         |
# >> | ExclusionCompositeOp        |
# >> | HardLightCompositeOp        |
# >> | HueCompositeOp              |
# >> | InCompositeOp               |
# >> | LightenCompositeOp          |
# >> | LightenIntensityCompositeOp |
# >> | LinearBurnCompositeOp       |
# >> | LinearDodgeCompositeOp      |
# >> | LinearLightCompositeOp      |
# >> | LuminizeCompositeOp         |
# >> | MathematicsCompositeOp      |
# >> | MinusDstCompositeOp         |
# >> | MinusSrcCompositeOp         |
# >> | ModulateCompositeOp         |
# >> | ModulusAddCompositeOp       |
# >> | ModulusSubtractCompositeOp  |
# >> | MultiplyCompositeOp         |
# >> | NoCompositeOp               |
# >> | OutCompositeOp              |
# >> | OverCompositeOp             |
# >> | OverlayCompositeOp          |
# >> | PegtopLightCompositeOp      |
# >> | PinLightCompositeOp         |
# >> | PlusCompositeOp             |
# >> | ReplaceCompositeOp          |
# >> | SaturateCompositeOp         |
# >> | ScreenCompositeOp           |
# >> | SoftLightCompositeOp        |
# >> | SrcAtopCompositeOp          |
# >> | SrcCompositeOp              |
# >> | SrcInCompositeOp            |
# >> | SrcOutCompositeOp           |
# >> | SrcOverCompositeOp          |
# >> | ThresholdCompositeOp        |
# >> | UndefinedCompositeOp        |
# >> | VividLightCompositeOp       |
# >> | XorCompositeOp              |
# >> | HardMixCompositeOp          |
# >> | CopyAlphaCompositeOp        |
# >> |-----------------------------|
