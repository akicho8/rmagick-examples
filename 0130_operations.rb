require "./setup"

operations = [
  "AtopCompositeOp",
  "BlendCompositeOp",
  "BlurCompositeOp",
  "BumpmapCompositeOp",
  "ChangeMaskCompositeOp",
  "ClearCompositeOp",
  "ColorBurnCompositeOp",
  "ColorDodgeCompositeOp",
  "ColorizeCompositeOp",
  "CopyBlackCompositeOp",
  "CopyBlueCompositeOp",
  "CopyCompositeOp",
  "CopyCyanCompositeOp",
  "CopyGreenCompositeOp",
  "CopyMagentaCompositeOp",
  "CopyAlphaCompositeOp",
  "CopyRedCompositeOp",
  "CopyYellowCompositeOp",
  "DarkenCompositeOp",
  "DarkenIntensityCompositeOp",
  "DistortCompositeOp",
  "DivideDstCompositeOp",
  "DivideSrcCompositeOp",
  "DstAtopCompositeOp",
  "DstCompositeOp",
  "DstInCompositeOp",
  "DstOutCompositeOp",
  "DstOverCompositeOp",
  "DifferenceCompositeOp",
  "DisplaceCompositeOp",
  "DissolveCompositeOp",
  "ExclusionCompositeOp",
  "HardLightCompositeOp",
  "HardMixCompositeOp",
  "HueCompositeOp",
  "InCompositeOp",
  "LightenCompositeOp",
  "LightenIntensityCompositeOp",
  "LinearBurnCompositeOp",
  "LinearDodgeCompositeOp",
  "LinearLightCompositeOp",
  "LuminizeCompositeOp",
  "MathematicsCompositeOp",
  "MinusDstCompositeOp",
  "MinusSrcCompositeOp",
  "ModulateCompositeOp",
  "ModulusAddCompositeOp",
  "ModulusSubtractCompositeOp",
  "MultiplyCompositeOp",
  "NoCompositeOp",
  "OutCompositeOp",
  "OverCompositeOp",
  "OverlayCompositeOp",
  "PegtopLightCompositeOp",
  "PinLightCompositeOp",
  "PlusCompositeOp",
  "ReplaceCompositeOp",
  "SaturateCompositeOp",
  "ScreenCompositeOp",
  "SoftLightCompositeOp",
  "SrcAtopCompositeOp",
  "SrcCompositeOp",
  "SrcInCompositeOp",
  "SrcOutCompositeOp",
  "SrcOverCompositeOp",
  "ThresholdCompositeOp",
  "UndefinedCompositeOp",
  "VividLightCompositeOp",
  "XorCompositeOp",
]

file = Pathname("images/matrix_1024x768.png")
image1 = Magick::Image.read(file).first

image2 = Magick::Image.read(file).first
image2.colorspace = Magick::GRAYColorspace
image2 = image2.spread(4).blur_image(0, 2)

operations.each do |e|
  image3 = image1.composite(image2, 0, 0, Magick.const_get(e))
  file = Pathname("_operations/#{e}.png")
  FileUtils.makedirs(file.dirname)
  image3.write(file)
  puts e
end
`open _operations`
