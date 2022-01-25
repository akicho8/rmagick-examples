require "./setup"

layer1 = Image.new(800, 800) { |e| e.background_color = "white" }
gc = Draw.new
gc.annotate(layer1, 0, 0, 0, 0, "Y") do |e|
  e.gravity     = CenterGravity
  e.font        = "WebDings"
  e.stroke      = "black"
  e.pointsize   = 300
end
d layer1
