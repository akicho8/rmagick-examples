require "./setup"

rows = [
  { key: "eva0",  base_color: "hsl(0,0%,100%)", main_color: "hsla( 40,60%,60%,0.2)", stroke_width: 24, width: 1920, height: 1080, },
  { key: "eva1",  base_color: "hsl(0,0%,100%)", main_color: "hsla(268,60%,60%,0.2)", stroke_width: 24, width: 1920, height: 1080, },
  { key: "eva2",  base_color: "hsl(0,0%,100%)", main_color: "hsla(  0,60%,60%,0.2)", stroke_width: 24, width: 1920, height: 1080, },
  { key: "eva6",  base_color: "hsl(0,0%,100%)", main_color: "hsla(209,60%,60%,0.2)", stroke_width: 24, width: 1920, height: 1080, },
  { key: "eva8",  base_color: "hsl(0,0%,100%)", main_color: "hsla(327,60%,60%,0.2)", stroke_width: 24, width: 1920, height: 1080, },
  { key: "eva13", base_color: "hsl(0,0%,0%)",   main_color: "hsla(266,50%,60%,0.2)", stroke_width: 24, width: 1920, height: 1080, },
].collect do |params|
  rect = Rect[params[:width], params[:height]]
  layer1 = Image.new(*rect) { |e| e.background_color = params[:base_color] }
  w = params[:stroke_width]
  h = params[:stroke_width]
  (layer1.rows.fdiv(h)).ceil.times do |y|
    if y.even?
      g = Draw.new
      g.fill = params[:main_color]
      g.rectangle(0, y * h, layer1.columns, y.next * h)
      g.draw(layer1)
    end
  end
  (layer1.columns.fdiv(w)).ceil.times do |x|
    if x.even?
      g = Draw.new
      g.fill = params[:main_color]
      g.rectangle(x * w, 0, x.next * w, layer1.rows)
      g.draw(layer1)
    end
  end

  # d layer1

  # color = Pixel.from_hsla(0, 0, 180).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
  # layer2 = Image.read("radial-gradient:#{color}-transparent") { |e| e.size = "#{layer1.columns}x#{layer1.rows}" }.first
  # layer1 = layer1.modulate(0.4).composite(layer2, 0, 0, ScreenCompositeOp)

  # d layer1

  # if false
  #   layer1 = layer1.implode(-0.5) # 放射状に拡大
  # end
  d layer1

  layer1.write("PNG24:../bioshogi/lib/bioshogi/assets/images/background/gingham_check_#{params[:key]}.png")
end
