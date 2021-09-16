require "./setup"

Image.read("rose:").first.colorspace # => SRGBColorspace=23

ColorspaceType.values.each do |e|
  image = Image.read("logo:").first
  image.colorspace = e
  d image, e
end

tp ColorspaceType.values

# >> |-----------------------|
# >> | UndefinedColorspace   |
# >> | RGBColorspace         |
# >> | GRAYColorspace        |
# >> | TransparentColorspace |
# >> | OHTAColorspace        |
# >> | XYZColorspace         |
# >> | YCbCrColorspace       |
# >> | YCCColorspace         |
# >> | YIQColorspace         |
# >> | YPbPrColorspace       |
# >> | YUVColorspace         |
# >> | CMYKColorspace        |
# >> | SRGBColorspace        |
# >> | HSLColorspace         |
# >> | HWBColorspace         |
# >> | HSBColorspace         |
# >> | LabColorspace         |
# >> | Rec601YCbCrColorspace |
# >> | Rec709YCbCrColorspace |
# >> | LogColorspace         |
# >> | CMYColorspace         |
# >> | LuvColorspace         |
# >> | HCLColorspace         |
# >> | LCHColorspace         |
# >> | LMSColorspace         |
# >> | LCHabColorspace       |
# >> | LCHuvColorspace       |
# >> | ScRGBColorspace       |
# >> | HSIColorspace         |
# >> | HSVColorspace         |
# >> | HCLpColorspace        |
# >> | YDbDrColorspace       |
# >> | XyYColorspace         |
# >> | LinearGRAYColorspace  |
# >> | JzazbzColorspace      |
# >> |-----------------------|
