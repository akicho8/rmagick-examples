require "./setup"

def run(color1, color2)
  w = 4096 * 2
  h = 4096 * 2
  one = 16
  layer = Image.new(w, h) { |e| e.background_color = color1 }
  0.step(by: 2, to: layer.rows.div(one)) do |y|
    gc = Draw.new
    gc.fill = color2
    gc.rectangle(0, y * one, layer.columns - 1, y.next * one - 1)
    gc.draw(layer)
  end
  layer = layer.rotate(45)
  w = 1280
  h =  720
  d layer.crop(CenterGravity, -w/2, -h/2, w, h, true) # 最後の true が +repage 相当でオフセットを取って +0+0 にする
end

run("hsl(335,86%,56%)", "hsl(337,73%,51%)").write("PNG8:../bioshogi/lib/bioshogi/assets/images/splatoon_red_stripe.png")
run("hsl(118,82%,47%)", "hsl(120,80%,43%)").write("PNG8:../bioshogi/lib/bioshogi/assets/images/splatoon_green_stripe.png")
