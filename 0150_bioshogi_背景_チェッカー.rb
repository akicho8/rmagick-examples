require "./setup"

rows = [
  { name: "light", rect: Rect[1920, 1080], base_color: "#fff", accent_color: "rgba(  0,  0,  0,0.06)", w: 24, h: 24 },
  { name: "dark",  rect: Rect[1920, 1080], base_color: "#555", accent_color: "rgba(255,255,255,0.06)", w: 24, h: 24 },
].collect do |params|
  layer = Image.new(*params[:rect]) { |e| e.background_color = params[:base_color] }
  w, h = params.values_at(:w, :h)
  (layer.rows.fdiv(h)).ceil.times do |y|
    (layer.columns.fdiv(w)).ceil.times do |x|
      if (x + y).even?
        g = Draw.new
        g.fill(params[:accent_color])
        g.rectangle(x * w, y * h, x * w + w - 1, y * h + h - 1)
        g.draw(layer)
      end
    end
  end
  d layer
  layer.write("PNG24:../bioshogi/lib/bioshogi/assets/images/background/checker_#{params[:name]}.png")
end
