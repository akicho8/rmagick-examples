require "./setup"
color = Pixel.from_hsla(0, 0, 255).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
layer1 = Image.read(PAKUTASO1).first
layer2 = Image.read("radial-gradient:#{color}-transparent") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first
d layer1.composite(layer2, 0, 0, ScreenCompositeOp)
