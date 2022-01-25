require "./setup"

# ↓によると PNG24: を書くほかないらしい
# http://ja.uwenku.com/question/p-eumifvol-hn.html

# 失敗。SRGBColorspace を指定しても意味ない
layer = Image.new(32, 32) do |e|
  e.colorspace = Magick::SRGBColorspace
end
layer.write("_output1.png")
`exiftool _output1.png | grep 'Color Type'`.strip.sub(/.*:\s*/, "") # => "Grayscale"

layer.write("PNG24:_output1.png")
`exiftool _output1.png | grep 'Color Type'`.strip.sub(/.*:\s*/, "") # => "RGB"

