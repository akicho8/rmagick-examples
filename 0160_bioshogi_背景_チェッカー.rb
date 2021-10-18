require "./setup"

rows = [
  { key: "grey_light", base_color: "hsl(  0,  0%,100%)", accent_color: "hsla(0,0%,  0%,0.06)", },
  { key: "grey_dark",  base_color: "hsl(  0,  0%, 30%)", accent_color: "hsla(0,0%,100%,0.06)", },
  { key: "red_dark",   base_color: "hsl(  0,100%, 30%)", accent_color: "hsla(0,0%,  0%,0.15)", },
  { key: "blue_dark",  base_color: "hsl(240,100%, 30%)", accent_color: "hsla(0,0%,  0%,0.15)", },
].collect do |params|
  rect = Rect[1920, 1080]
  layer = Image.new(*rect) { |e| e.background_color = params[:base_color] }
  w = 24
  h = 24
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
  layer.write("PNG24:../bioshogi/lib/bioshogi/assets/images/background/checker_#{params[:key]}.png")
end
