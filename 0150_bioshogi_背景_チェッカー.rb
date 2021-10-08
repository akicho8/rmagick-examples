require "./setup"

rows = [
  { name: "light", rect: Rect[1920, 1080], base_color: "#fff", accent_color: "rgba(  0,  0,  0,0.05)", w: 16, h: 16 },
  { name: "dark",  rect: Rect[1920, 1080], base_color: "#333", accent_color: "rgba(255,255,255,0.05)", w: 16, h: 16 },
].collect do |params|
  canvas = Image.new(*params[:rect]) { |e| e.background_color = params[:base_color] }
  w, h = params.values_at(:w, :h)
  (canvas.rows.fdiv(h)).ceil.times do |y|
    (canvas.columns.fdiv(w)).ceil.times do |x|
      if (x + y).even?
        g = Draw.new
        g.fill(params[:accent_color])
        g.rectangle(x * w, y * h, x * w + w - 1, y * h + h - 1)
        g.draw(canvas)
      end
    end
  end
  canvas.write("PNG24:_checker/checker_#{params[:name]}.png")
  canvas.write("PNG24:../bioshogi/lib/bioshogi/assets/images/background/checker_#{params[:name]}.png")
end
