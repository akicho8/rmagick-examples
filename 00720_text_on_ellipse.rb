require "./setup"

canvas = Image.read("netscape:").first
canvas.resize!(800, 800)

# この文字にしたい
if true
  psize = 32
  gc = Draw.new
  gc.annotate(canvas, psize, psize, 400, 400, "龍") do |e|
    e.font      = "fonts/RictyDiminished-Bold.ttf"
    e.fill      = "white"
    e.pointsize = psize
    e.gravity   = CenterGravity
  end
end

gc = Draw.new
gc.fill("rgba(0,0,0,0.3)")
gc.ellipse(400, 400, 100, 50, 0, 360) # x, y, widgh, height, 角度
# gc.circle(400, 400, 410, 400) # x, y, widgh, height, 角度
gc.draw(canvas)

d canvas
