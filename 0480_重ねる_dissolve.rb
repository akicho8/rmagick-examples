require "./setup"
src = Image.read("wizard:").first
dst = Image.read("logo:").first
d dst.dissolve(src, 0.2, 1.0, CenterGravity) # よくわからない
