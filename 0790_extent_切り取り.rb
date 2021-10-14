require "./setup"

layer = Image.read("netscape:").first.resize(400, 400)
d layer
d layer.extent(200, 200)               # 左上を基点に 200x200 で抜く
d layer.extent(200, 200, 100, 100)     # 中央にするには 3, 4 引数で左上の基点を指定する

