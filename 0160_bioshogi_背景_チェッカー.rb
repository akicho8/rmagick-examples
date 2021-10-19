require "./setup"

rows = [
  { key: "grey_light", base_color: "hsl(  0,  0%,100%)", accent_color: "hsla(0,0%,  0%,0.06)", },
  { key: "grey_dark",  base_color: "hsl(  0,  0%, 30%)", accent_color: "hsla(0,0%,100%,0.06)", },
  { key: "red_dark",   base_color: "hsl(  0,100%, 30%)", accent_color: "hsla(0,0%,  0%,0.15)", },
  { key: "blue_dark",  base_color: "hsl(240,100%, 30%)", accent_color: "hsla(0,0%,  0%,0.15)", },
].collect do |params|
  rect = Rect[1920, 1080]
  layer1 = Image.new(*rect) { |e| e.background_color = params[:base_color] }
  w = 24
  h = 24
  (layer1.rows.fdiv(h)).ceil.times do |y|
    (layer1.columns.fdiv(w)).ceil.times do |x|
      if (x + y).even?
        g = Draw.new
        g.fill(params[:accent_color])
        g.rectangle(x * w, y * h, x * w + w - 1, y * h + h - 1)
        g.draw(layer1)
      end
    end
  end
  # d layer1

  color = Pixel.from_hsla(0, 0, 180).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
  layer2 = Image.read("radial-gradient:#{color}-transparent") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first
  layer1 = layer1.modulate(0.4).composite(layer2, 0, 0, ColorDodgeCompositeOp)
  d layer1

  layer1.write("PNG24:../bioshogi/lib/bioshogi/assets/images/background/checker_#{params[:key]}.png")
end
