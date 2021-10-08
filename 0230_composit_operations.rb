require "./setup"

file = Pathname("images/matrix_1024x768.png")
image1 = Image.read(file).first

image2 = Image.read(file).first
image2.colorspace = GRAYColorspace
image2 = image2.spread(4).blur_image(0, 2)

tp CompositeOperator.values

CompositeOperator.values.each do |e|
  image1.composite(image2, 0, 0, e).to_file("operators/#{e}")
end
`open _operations`
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
