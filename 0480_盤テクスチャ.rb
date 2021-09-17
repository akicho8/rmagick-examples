require "./setup"

def fn(index)
  "RGB24:../bioshogi/lib/bioshogi/assets/images/board/board_texture#{index}.png"
end

layer = Image.new(1080*2, 1080*2) { |e| e.background_color = KOMAIRO }
layer = layer.fx("p * 0.9 + rand() * 0.2") # 明るさを変えないように 1.0 を中心にする
layer = layer.motion_blur(0, 30, 90 * 3)   # (radius, sigma, angle) sigmaで縦線の長さが変わる。90*3 は上方向
# 端は blur が不安定なので中央で切り取る
layer = layer.crop(layer.columns*0.25, layer.rows*0.25, layer.columns*0.5, layer.rows*0.5, true) # 最後の true が +repage 相当でオフセットを取って +0+0 にする
layer.modulate(0.90, 1.0, 1.0).write(fn(1))                  # 若干暗くする
layer.modulate(0.85, 1.0, 1.0).write(fn(2))                  # 若干暗くする
layer.modulate(0.80, 1.0, 1.0).write(fn(3))                  # ぼんやり版
layer.modulate(0.75, 1.0, 1.0).write(fn(4))                  # ぼんやり版
layer.modulate(0.80, 1.0, 1.0).blur_image(0, 1).write(fn(5)) # ぼんやり版
layer.modulate(0.75, 1.0, 1.0).blur_image(0, 1).write(fn(6)) # ぼんやり版
