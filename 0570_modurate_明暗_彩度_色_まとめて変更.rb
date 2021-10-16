require "./setup"
layer1 = Image.read("logo:").first
d layer1

d layer1.modulate(1.0, 1.0, 1.0) # LSHの順。1.0 では何も変化しない
d layer1.modulate(0.2)           # 暗くする
d layer1.modulate(1.0, 0.2)      # 色味をなくす
d layer1.modulate(1.0, 1.0, 0.5) # H + 180度 (?)
