require "./setup"

# グレーの背景画像にカラー画像を重ねるときは背景の colorspace = SRGBColorspace にしないとすべてグレーになる
# grey? を呼ぶと危険。読み取りメソッドと見せ掛けて状態が変更され SRGBColorspace でも GRAYColorspace になってしまう
# でも colorspace = SRGBColorspace の方が強い

# 失敗
img1 = Image.new(640, 480) { |e| e.background_color = "#888" }
img1.write("_output1.png")
`exiftool _output1.png | grep -i 'Color Type'` # => "Color Type                      : Grayscale\n"
img1 = Image.read("_output1.png").first
# img1.grey?                                     # => true
# img1.colorspace = SRGBColorspace                 # => SRGBColorspace=23
img1.colorspace                 # => GRAYColorspace=3
img2 = Image.read("logo:").first.resize(256, 256)
d img1.composite(img2, CenterGravity, 0, 0, OverCompositeOp)

# 成功
img1 = Image.new(640, 480) { |e| e.background_color = "#888" }
img1.write("PNG24:_output3.png")
`exiftool _output3.png | grep -i 'Color Type'` # => "Color Type                      : RGB\n"
img1 = Image.read("_output3.png").first
# img1.grey?                                     # => true
# img1.colorspace = SRGBColorspace                 # => SRGBColorspace=23
img1.colorspace                 # => GRAYColorspace=3
img2 = Image.read("logo:").first.resize(256, 256)
d img1.composite(img2, CenterGravity, 0, 0, OverCompositeOp)
