require "./setup"

[
  { key: "mito",     font: "WebDings",  text: %(n), bg_color: "hsl(346, 60%,60%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 0.8, char_count_w: 20, char_count_h: 6,  },
  { key: "skelton",  font: "Wingdings", text: %(N), bg_color: "hsl(  0,  0%,60%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 1.0, char_count_w: 16, char_count_h: 5,  },
  { key: "heart",    font: "WebDings",  text: %(Y), bg_color: "hsl(327, 70%,75%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 0.8, char_count_w: 16, char_count_h: 5,  },

  { key: "eva0",     font: "WebDings",  text: %(n), bg_color: "hsl( 40, 50%,55%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 0.8, char_count_w: 24, char_count_h: 8, },
  { key: "eva1",     font: "WebDings",  text: %(n), bg_color: "hsl(268, 70%,50%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 0.8, char_count_w: 24, char_count_h: 8, },
  { key: "eva2",     font: "WebDings",  text: %(n), bg_color: "hsl(  0, 40%,35%)", text_color: "hsla(0,0%,100%,0.1)", width: 1920, height: 1080, char_rate: 0.8, char_count_w: 24, char_count_h: 8, },
  { key: "eva6",     font: "WebDings",  text: %(n), bg_color: "hsl(209, 54%,25%)", text_color: "hsla(0,0%,100%,0.1)", width: 1920, height: 1080, char_rate: 0.8, char_count_w: 24, char_count_h: 8, },
  { key: "eva8",     font: "WebDings",  text: %(n), bg_color: "hsl(327, 69%,77%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 0.8, char_count_w: 24, char_count_h: 8, },
  { key: "eva13",    font: "WebDings",  text: %(n), bg_color: "hsl(266, 18%,41%)", text_color: "hsla(0,0%,100%,0.1)", width: 1920, height: 1080, char_rate: 0.8, char_count_w: 24, char_count_h: 8, },

  # { key: "spider",    font: "WebDings",  text: %("), bg_color: "hsl(35,100%,85%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 0.5, char_count_w: 16, char_count_h: 16,  },
  # { key: "diamond",   font: "Wingdings", text: %(u), bg_color: "hsl(346,84%,70%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 0.5, char_count_w: 16, char_count_h: 16,  },
  # { key: "spider",    font: "WebDings",  text: %("), bg_color: "hsl(360,96%,36%)", text_color: "hsla(0,0%,100%,0.2)", width: 1920, height: 1080, char_rate: 0.5, char_count_w: 16, char_count_h: 16,  },
].collect do |params|
  texture_size_w = params[:width]  / params[:char_count_w]
  texture_size_h = params[:height] / params[:char_count_h]

  func = -> fill {
    layer = Image.new(texture_size_w, texture_size_h) { |e| e.background_color = "transparent" }
    gc = Draw.new
    gc.annotate(layer, 0, 0, 0, 0, params[:text]) do |e|
      e.gravity   = CenterGravity
      e.font      = params[:font]
      e.fill      = fill
      e.pointsize = texture_size_w * params[:char_rate]
    end
    layer
  }

  char_layer   = func.call(params[:text_color])
  accent_layer = func.call(params[:accent_color] || params[:text_color])

  # metrics = gc.get_type_metrics(params[:text])
  # p metrics.width
  # p metrics.height

  w = char_layer.columns
  h = char_layer.rows
  rect = Vector[params[:width], params[:height]] / 1.0
  layer1 = Image.new(*rect) { |e| e.background_color = params[:bg_color] }
  layer1.rows.fdiv(h).ceil.next.times do |y|
    layer1.columns.fdiv(w).ceil.next.times do |x|
      half_y = h/2
      rx = x * w - w / 2
      ry = y * h - (x.even? ? 0 : half_y)
      # layerx = rand >= 0.1 ? char_layer : accent_layer
      layerx = char_layer
      layer1 = layer1.composite(layerx, rx, ry, OverCompositeOp)
    end
  end

  # layer1 = layer1.implode(-0.5) # ??????????????????
  d layer1

  layer1.write("PNG24:../bioshogi/lib/bioshogi/assets/images/background/emoji_pattern_#{params[:key]}.png")
end
