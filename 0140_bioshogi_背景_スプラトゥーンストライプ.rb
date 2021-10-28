require "./setup"

[
  { key: :red,    color1: "hsl(335,86%,56%)",  color2: "hsl(337,73%, 51%)", },
  { key: :green,  color1: "hsl(118,82%,47%)",  color2: "hsl(120,80%, 43%)", },
  { key: :purple, color1: "hsl(278,100%,47%)", color2: "hsl(278,100%,43%)", },
].each do |params|
  w = 4096 * 2
  h = 4096 * 2
  one = 16
  layer1 = Image.new(w, h) { |e| e.background_color = params[:color1] }
  0.step(by: 2, to: layer1.rows.div(one)) do |y|
    gc = Draw.new
    gc.fill = params[:color2]
    gc.rectangle(0, y * one, layer1.columns - 1, y.next * one - 1)
    gc.draw(layer1)
  end
  layer1 = layer1.rotate(45)
  w = 1920
  h = 1080
  layer1 = layer1.crop(CenterGravity, -w/2, -h/2, w, h, true) # 最後の true が +repage 相当でオフセットを取って +0+0 にする
  d layer1
  layer1.write("PNG24:../bioshogi/lib/bioshogi/assets/images/background/splatoon_stripe_#{params[:key]}.png")
end
