require "./setup"

layer = Image.read("plasma:fractal") { |e| e.size = "400x400" }.first
d layer
d layer.extent(layer.columns*0.5, layer.rows*0.5, layer.columns*0.25, layer.rows*0.25)
d layer.crop(layer.columns*0.25, layer.rows*0.25, layer.columns*0.5, layer.rows*0.5, true) # 最後を true にしないと位置情報が付く
