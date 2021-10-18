require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/piece/piece_texture#{index}.png"
end

layer = Image.new(512, 512) { |e| e.background_color = KOMAIRO }
layer = layer.fx("p * 0.9 + rand() * 0.2") # 明るさを変えないように 1.0 を中心にする
layer = layer.motion_blur(0, 10, 90 * 3)   # (radius, sigma, angle) sigmaで流れの幅が変わる

# 端は blur が不安定なので中央で切り取る
p layer.extent(layer.columns * 0.5, layer.rows * 0.5, layer.columns*0.25, layer.rows*0.25)
p layer.crop(layer.columns*0.25, layer.rows*0.25, layer.columns*0.5, layer.rows*0.5, true) # 最後の true が +repage 相当でオフセットを取って +0+0 にする
exit

d layer.extent(layer.columns * 0.5, layer.rows * 0.5, layer.columns*0.25, layer.rows*0.25)
layer = layer.crop(layer.columns*0.25, layer.rows*0.25, layer.columns*0.5, layer.rows*0.5, true) # 最後の true が +repage 相当でオフセットを取って +0+0 にする
d layer
exit

d layer.modulate(0.96, 1.0, 1.0).write(fn("096"))
d layer.modulate(0.98, 1.0, 1.0).write(fn("098"))
d layer.modulate(1.00, 1.0, 1.0).write(fn("100"))
d layer.modulate(1.02, 1.0, 1.0).write(fn("102"))
d layer.modulate(1.04, 1.0, 1.0).write(fn("104"))
d layer.modulate(1.06, 1.0, 1.0).write(fn("106"))

# layer = layer.blur_image(0, 1)  # 木目がぼんやり版
# d layer.write(fn(2))
