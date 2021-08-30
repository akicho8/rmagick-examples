require "./setup"
rows = [
  { rect: Rect[800, 600], base_color: "#fff", accent_color: "rgba(  0,  0,  0,0.1)", w: 50, h: 50 },
  { rect: Rect[800, 600], base_color: "#333", accent_color: "rgba(255,255,255,0.1)", w: 50, h: 50 },
].collect.with_index do |params, i|
  canvas = Magick::Image.new(*params[:rect]) { |e| e.background_color = params[:base_color] }
  w, h = params.values_at(:w, :h)
  (canvas.rows.fdiv(h)).ceil.times do |y|
    (canvas.columns.fdiv(w)).ceil.times do |x|
      if (x + y).even?
        g = Magick::Draw.new
        g.fill(params[:accent_color])
        g.rectangle(x * w, y * h, x * w + w - 1, y * h + h - 1)
        g.draw(canvas)
      end
    end
  end
  file = Pathname("_checker/#{i}.png")
  FileUtils.makedirs(file.dirname)
  canvas.write(file)
  {
    :file => file,
  }
end
`open _checker`
tp rows
# >> |---------------|
# >> | file          |
# >> |---------------|
# >> | checker/0.png |
# >> | checker/1.png |
# >> |---------------|
