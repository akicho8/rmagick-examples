require "./setup"
# 暗い状態からだんだん白くなっていく……？
image = Image.read("logo:").first
0.step(to: 2.0, by: 0.2) do |i|
  d image.blue_shift(i), i
end
