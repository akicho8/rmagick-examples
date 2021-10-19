require "./setup"

layer1 = Image.new(800, 800) { |e| e.background_color = "white" }

f = -> (x, y, w, h, r, pointsize, str) {
  gc = Draw.new
  gc.annotate(layer1, w, h, x, y, str) do |e|
    e.font      = "fonts/RictyDiminished-Bold.ttf"
    e.fill      = "hsla(120,50%,50%,0.5)"
    e.pointsize = pointsize
    # e.interline_spacing = 0
    # e.interword_spacing = 0
    e.gravity   = CenterGravity
  end
  gc = Draw.new
  gc.fill("rgba(0,0,0,0.3)")
  from = [x + w/2, y + h/2]
  to   = [x + w/2 + r, y + h/2]
  gc.circle(*from, *to)
  gc.draw(layer1)
}

f.(100,   0, 32, 32, 12, 10, "4") # 小さいとずれて見えるが計算は正しい
f.(200,   0, 32, 32, 12, 10, "42")
f.(300,   0, 32, 32, 12, 10, "423")
f.(100, 100, 32, 32, 20, 20, "4")
f.(200, 100, 32, 32, 20, 20, "42")
f.(300, 100, 32, 32, 20, 20, "423")
d layer1
