require "./setup"

canvas = Image.read("netscape:").first.resize(800, 600)

sw = canvas.columns
sh = canvas.rows
cw = sw / 2
ch = sh / 2

cell_w = 360
cell_h = 400
center_x = cw
center_y = ch

munenaga = 0.7 # 胸長
katahaba = 0.8 # 肩幅
asinaga  = 1.0 # 臍下
hunbari  = 1.0 # ふんばり片幅
kaonaga  = 1.0 # 顔の長さ
scale    = 0.8 # 全体の倍率

points = []
points << [0.0,       -kaonaga]  # 頂点
points << [-katahaba, -munenaga] # 左肩
points << [-hunbari,   +asinaga] # 左後
points << [+hunbari,   +asinaga] # 右後
points << [+katahaba, -munenaga] # 右肩
points = points.collect { |x, y|
  [
    cw + x * scale * (cell_w * 0.5),
    ch + y * scale * (cell_h * 0.5),
  ]
}

# 確認用の領域
gc = Draw.new
gc.stroke_width(3)
gc.stroke("#000")
gc.fill("#0008")
gc.rectangle(center_x - cell_w/2, center_y - cell_h/2, center_x + cell_w/2, center_y + cell_h/2)
gc.draw(canvas)

# 六角形
gc = Draw.new
gc.stroke_width(3)
gc.stroke("#000088")
gc.fill_pattern = Image.read("images/pakutexture06210140.png").first
gc.polygon(*points.flatten)
gc.draw(canvas)

d canvas
