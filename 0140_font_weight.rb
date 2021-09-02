require "./setup"

tp WeightType.values

WeightType.values.each do |weight_type|
  canvas = Image.read("logo:").first.resize(800, 600)
  gc = Draw.new
  gc.annotate(canvas, 0, 0, 0, 0, "龍") do |e|
    e.gravity     = CenterGravity
    e.font        = "fonts/RictyDiminished-Regular.ttf"
    e.stroke      = "black"
    e.pointsize   = 300
    e.font_weight = weight_type # 変化なし
  end
  d canvas
end
# >> |---------------|
# >> | AnyWeight     |
# >> | NormalWeight  |
# >> | BoldWeight    |
# >> | BolderWeight  |
# >> | LighterWeight |
# >> |---------------|
