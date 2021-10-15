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

# 盤
layer1 = Image.read("images/board.png").first

# 中央光
color = Pixel.from_hsla(0, 0, 80).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
layer2 = Image.read("radial-gradient:#{color}-transparent") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first

# 雲
layer3 = Image.read("plasma:black-black") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first
# layer3 = Image.read("plasma:fractal") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first
layer3.colorspace = GRAYColorspace
layer3 = layer3.blur_image(0, 50)
d layer3

# d layer1.composite(layer3, 0, 0, SoftLightCompositeOp) # 雲で濃くする
# d layer1.composite(layer3, 0, 0, ScreenCompositeOp)    # 雲で明くする
# 
# d layer1.composite(layer2, 0, 0, SoftLightCompositeOp) # 中央光で濃くする
# d layer1.composite(layer2, 0, 0, ScreenCompositeOp)    # 中央光で明くする
# 
# d layer1.composite(layer3, 0, 0, SoftLightCompositeOp).composite(layer2, 0, 0, ScreenCompositeOp) # 雲で濃くして中央明るく
# d layer1.composite(layer3, 0, 0, ScreenCompositeOp).composite(layer2, 0, 0, SoftLightCompositeOp) # 雲で明くして中央暗く
# 
# OFTEN_USE_OP.each { |e| d layer1.composite(layer3, 0, 0, e), "雲#{e}" } # 雲の追加の合成タイプ確認
# OFTEN_USE_OP.each { |e| d layer1.composite(layer2, 0, 0, e), "光#{e}" } # 光の追加の合成タイプ確認

CompositeOperator.values.each { |e| d layer1.composite(layer3, 0, 0, e), "雲#{e}" } # 雲の追加の合成タイプ確認
