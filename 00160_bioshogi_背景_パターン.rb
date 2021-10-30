require "./setup"

[
  { key: "heart", text: "Y", },
].collect do |params|
  texture_size = 1920/16
  pointsize    = texture_size * 0.5

  layer_h = Image.new(texture_size, texture_size) { |e| e.background_color = "transparent" }
  gc = Draw.new
  gc.annotate(layer_h, 0, 0, 0, 0, params[:text]) do |e|
    e.gravity   = CenterGravity
    e.font      = "WebDings"
    e.fill      = "HotPink"
    e.pointsize = pointsize
  end

  w = layer_h.columns
  h = layer_h.rows
  layer1 = Image.new(1920, 1080) { |e| e.background_color = "white" }
  layer1.rows.fdiv(h).ceil.next.times do |y|
    layer1.columns.fdiv(w).ceil.next.times do |x|
      layer1 = layer1.composite(layer_h, x * w - w / 2, y * h - (x.even? ? 0 : h/2), OverCompositeOp)
    end
  end

  d layer1

  layer1.write("PNG24:../bioshogi/lib/bioshogi/assets/images/background/pattern_#{params[:key]}.png")
end
