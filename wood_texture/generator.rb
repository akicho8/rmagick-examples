# -*- compile-command: "ruby generator.rb && cd ~/src/bioshogi/experiment/image_renderer && ruby 0240_color_theme.rb" -*-

# groovy の WoodFilter を ruby から無理矢理使って木目画像を生成
# h: 30:赤い 45:黄色い
require "../setup"

class BoardInfo
  include MemoryRecord
  records = []

  records += [0.5].flat_map do |s|
    [0.550, 0.700].flat_map do |l|
      [45].flat_map do |h|
        [
          # nil,
          # "slight",
          # "cdark",
          "clight",
        ].flat_map do |mode|
          [
            [1.0, 200, 100],        # 本物っぽい。模様の数が多い・模様ほぼなし縦に延す。縦に拡大するため綺麗だけどややボケ
            [0.15, 15, 100],        # 模様盤。模様の数が少ない・模様が綺麗。縦に拡大するため綺麗だけどややボケ
            [0.15, 50, 10],         # ベニア板。模様の数が少ない・いい感じに縦線を作る。拡大しないため繊維が粗い
          ].flat_map do |ring, stretch, scale|
            # [0.550].flat_map do |l|
            [50].flat_map do |cloud_blur|
              { color1: [h, s, l], mode: mode, center_light_level: 50, ring: ring, stretch: stretch, scale: scale, cloud_blur: cloud_blur,  }
            end
          end
        end
      end
    end
  end

  records += [
    { fn_suffix: "_wars", color1: [39, 1.0, 0.68], mode: "cdark2", center_light_level: 50, ring: 0.15, stretch: 15, scale: 100, cloud_blur: 10, }
  ]

  # { color1: [43, 0.5, 0.550], mode: "clight", center_light_level: 50, },
  # { color1: [43, 0.5, 0.550], mode: "cdark",  center_light_level: 50, },
  # { color1: [38, 0.5, 0.550], mode: "clight", center_light_level: 50, },
  # { color1: [38, 0.5, 0.550], mode: "cdark",  center_light_level: 50, },
  # { color1: [33, 0.5, 0.550], mode: "clight", center_light_level: 50, },
  # { color1: [33, 0.5, 0.550], mode: "cdark",  center_light_level: 50, },
  #
  # { color1: [43, 0.5, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [43, 0.5, 0.720], mode: "cdark",  center_light_level: 50, },
  # { color1: [38, 0.5, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [38, 0.5, 0.720], mode: "cdark",  center_light_level: 50, },
  # { color1: [33, 0.5, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [33, 0.5, 0.720], mode: "cdark",  center_light_level: 50, },
  #
  # { color1: [43, 0.3, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [43, 0.3, 0.720], mode: "cdark",  center_light_level: 50, },
  # { color1: [38, 0.3, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [38, 0.3, 0.720], mode: "cdark",  center_light_level: 50, },
  # { color1: [33, 0.3, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [33, 0.3, 0.720], mode: "cdark",  center_light_level: 50, },
  #
  # { color1: [43, 0.8, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [43, 0.8, 0.720], mode: "cdark",  center_light_level: 50, },
  # { color1: [38, 0.8, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [38, 0.8, 0.720], mode: "cdark",  center_light_level: 50, },
  # { color1: [33, 0.8, 0.720], mode: "clight", center_light_level: 50, },
  # { color1: [33, 0.8, 0.720], mode: "cdark",  center_light_level: 50, },
  # ].collect { |e| e.merge(cloud_blur: 50) }

  memory_record records

  def fn_suffix
    super || code.next
  end

  def file_path
    "../../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture#{fn_suffix}.png"
  end

  def color2
    h, s, l = color1
    [h, s, l + 0.05]
  end

  def to_params
    {
      :width      => 1080,
      :height     => 1080,
      :angle      => nil,     # 角度 一周1.0
      :turbulence => 0,       # 揺れ
      :fibres     => 0,       # →繊維の数。0だと綺麗
      :ring       => ring,    # →細かくなる
      :scale      => scale,   # →拡大する(これ以上拡大するとぼける)
      :stretch    => stretch, # →縦方向の伸張でこれ以上拡大するとほぼ縦線ばかりになる
      :color1     => color1,
      :color2     => color2,
    }
  end
end

class BackgroundInfo
  include MemoryRecord
  records = [0.5].flat_map do |s|
    [45].flat_map do |h|
      [
        # nil,
        # "slight",
        # "cdark",
        "clight",
      ].flat_map do |mode|
        [
          # [0.15, 50, 10],         # 模様の数が少ない・いい感じに縦線を作る。拡大しないため繊維が粗い
          # [1.0, 200, 100],        # 模様の数が多い・模様ほぼなし縦に延す。縦に拡大するため綺麗だけどややボケ
          [0.15, 15, 100],        # 模様の数が少ない・元の模様が残りがち。縦に拡大するため綺麗だけどややボケ
        ].flat_map do |ring, stretch, scale|
          [[0.550 + 0.2, :dark], [0.700 + 0.15, :light]].flat_map do |l, key| # 変更禁止
            [50].flat_map do |cloud_blur|
              { key: key, color1: [h, s, l], mode: mode, center_light_level: 50, ring: ring, stretch: stretch, scale: scale, cloud_blur: cloud_blur,  }
            end
          end
        end
      end
    end
  end

  # p records.count
  # exit

  memory_record records

  def file_path
    "../../bioshogi/lib/bioshogi/assets/images/background/groovy_background_texture_#{key}.png"
  end

  def color2
    h, s, l = color1
    [h, s, l + 0.05]
  end

  def to_params
    {
      :width      => 1920,
      :height     => 1080,
      :angle      => 0.25,    # 角度 一周1.0
      :turbulence => 0,       # 揺れ
      :fibres     => 0,       # →繊維の数。0だと綺麗
      :ring       => ring,    # →細かくなる
      :scale      => scale,   # →拡大する(これ以上拡大するとぼける)
      :stretch    => stretch, # →縦方向の伸張でこれ以上拡大するとほぼ縦線ばかりになる
      :color1     => color1,
      :color2     => color2,
    }
  end
end

class BoardGalleryInfo
  include MemoryRecord

  records = [0.5, 0.6, 0.4, 1.0].flat_map do |s|
    [45, 43, 41, 39, 37].flat_map do |h|
      [
        nil,
        "slight",
        "cdark",
        "clight",
      ].flat_map do |mode|
        [
          [1.0, 200, 100],      # 本物。模様の数が多い・模様ほぼなし縦に延す。縦に拡大するため綺麗だけどややボケ
          [0.15, 15, 100],      # 模様多い。模様の数が少ない・元の模様が残りがち。縦に拡大するため綺麗だけどややボケ
          [0.15, 50, 10],       # ベニア板。模様の数が少ない・いい感じに縦線を作る。拡大しないため繊維が粗い
        ].flat_map do |ring, stretch, scale|
          [0.550, 0.625, 0.700].flat_map do |l|
            [50].flat_map do |cloud_blur|
              { color1: [h, s, l], mode: mode, center_light_level: 50, ring: ring, stretch: stretch, scale: scale, cloud_blur: cloud_blur,  }
            end
          end
        end
      end
    end
  end

  # p records.count
  # exit
  # pp records.take(4)
  # exit

  # records = [{ color1: [40, 0.5, 0.550], mode: nil, center_light_level: 50, ring: 0.15, stretch: 50,  cloud_blur: 50 }]
  # records = [{ color1: [40, 0.5, 0.550], mode: nil, center_light_level: 50, ring: 1.0, stretch: 200,  cloud_blur: 50 }]
  # records = [
  #   { color1: [34, 0.5, 0.550], mode: nil, center_light_level: 50, ring: 1.0, stretch: 200, cloud_blur: 50 },
  #   { color1: [34, 0.5, 0.560], mode: nil, center_light_level: 50, ring: 1.0, stretch: 200, cloud_blur: 50 },
  #   { color1: [34, 0.5, 0.550], mode: nil, center_light_level: 50, ring: 1.0, stretch: 200, cloud_blur: 50 },
  # ]

  memory_record records

  def file_path
    "../../shogi-extend/nuxt_side/static/material/board/%04d.png" % code.next
  end

  def color2
    h, s, l = color1
    [h, s, l + 0.05]
  end

  def to_params
    {
      :width      => 1080,
      :height     => 1080,
      :angle      => nil,     # 角度 一周1.0
      :turbulence => 0,       # 揺れ
      :fibres     => 0,       # →繊維の数。0だと綺麗
      :ring       => ring,    # →細かくなる
      :scale      => scale,   # →拡大する(これ以上拡大するとぼける)
      :stretch    => stretch,      # →縦方向の伸張でこれ以上拡大するとほぼ縦線ばかりになる
      :color1     => color1,
      :color2     => color2,
      :cloud_blur => cloud_blur,
    }
  end
end

class PieceInfo
  include MemoryRecord
  # 彩度下げるとスタンプ駒っぽくなる
  memory_record [
    { key: :wars,   color1: [39, 1.00, 0.74], desc: "共有将棋盤の駒(より濃い)",     }, # 自分で調整
    { key: :dark,   color1: [43, 1.00, 0.81], desc: "共有将棋盤の駒",               },
    { key: :light,  color1: [45, 1.00, 0.87], desc: "共有将棋盤の駒の彩度で明るく", },

    # { key: :extend_light, color1: [43, 1.00, 0.87], desc: "共有将棋盤の駒の再度で明るく", },
    # { key: :piyo_light,   color1: [52, 0.76, 0.87], desc: "ぴよ将棋の初期値",             }, # 緑がかっている
  ].collect { |e| e.merge(mode: nil, center_light_level: 50, cloud_blur: 50) }

  def file_path
    # "../../bioshogi/lib/bioshogi/assets/images/piece/groovy_piece_texture%02d.png" % code.next
    "../../bioshogi/lib/bioshogi/assets/images/piece/groovy_piece_texture_#{key}.png"
  end

  def color2
    h, s, l = color1
    [h, s, l + 0.05]
  end

  def to_params
    {
      :width      => 128,
      :height     => 128,
      :angle      => 0,
      :turbulence => 0,
      :fibres     => 0,
      :ring       => 0.15,
      :scale      => 10,
      :stretch    => 50,
      :color1     => color1,
      :color2     => color2,
      :cloud_blur => 50,
    }
  end
end

class Generator
  COLOR_LUMINOSITY_GAP = 0.05  # 明さの差 0.05 ぐらいが綺麗

  def run(list)
    tp list.count
    list.each do |e|
      groovy_process(e)
      rmagick_process(e)
    end
  end

  def groovy_process(e)
    source_file = Pathname("_output#{e.code}.groovy")
    source_file.write(source_body(e))
    system "groovy #{source_file}"
  end

  def source_body(e)
    params = e.to_params
    list = []
    list << "wf.setRings(#{params[:ring]}f)                             // 複雑度" if params[:ring]
    list << "wf.setScale(#{params[:scale]})                             // 拡大率" if params[:scale]
    list << "wf.setStretch(#{params[:stretch]}f)                        // 縦伸張率" if params[:stretch]
    list << "wf.setAngle((float)(ImageMath.PI * 2 * #{params[:angle]})) // 角度" if params[:angle]
    list << "wf.setTurbulence(#{params[:turbulence]}f)                  // 揺れ" if params[:turbulence]
    list << "wf.setFibres(#{params[:fibres]})                           // 繊維の量" if params[:fibres]
    list << "def lc = new LinearColormap((int)0xFF#{hex_color(*params[:color1])}, (int)0xFF#{hex_color(*params[:color2])})"
    list << "wf.setColormap(lc)"
    list = list.collect { |e| e + "\n" }.join
    source = []
    source << "@Grab(group='com.jhlabs', module='filters', version='2.0.235')"
    source << "import java.awt.*"
    source << "import java.awt.image.*"
    source << "import java.io.*"
    source << "import javax.imageio.*"
    source << "import com.jhlabs.composite.*"
    source << "import com.jhlabs.image.*"
    source << "def img = new BufferedImage(#{params[:width]}, #{params[:height]}, BufferedImage.TYPE_INT_RGB)"
    source << "def wf = new WoodFilter()"
    source << "#{list}"
    source << "img = wf.filter(img, null)"
    source << %(ImageIO.write(img, "png", new File("_output1.png")))
    source.join("\n")
  end

  def hex_color(h, s, l)
    Color::HSL.from_fraction(h / 360.0, s, l).html.sub("#", "")
  end

  def rmagick_process(e)
    src_layer = Image.read("_output1.png").first

    if e.mode
      # 中央が明るい
      xcolor = Pixel.from_hsla(0, 0, e.center_light_level).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
      center_clight_layer ||= Image.read("radial-gradient:#{xcolor}-transparent") { |e| e.size = "#{src_layer.columns}x#{src_layer.rows}" }.first

      # 雲
      cloud_layer = Image.read("plasma:black-black") { |e| e.size = "#{src_layer.columns}x#{src_layer.rows}" }.first
      cloud_layer.colorspace = GRAYColorspace
      cloud_layer = cloud_layer.blur_image(0, e.cloud_blur)

      if e.mode == "slight"
        out_layer = src_layer.composite(center_clight_layer, 0, 0, ScreenCompositeOp)   # 中央だけ明るくする
      end

      if e.mode == "clight"
        out_layer = src_layer.composite(cloud_layer, 0, 0, ScreenCompositeOp)           # 明るくして
        out_layer = out_layer.composite(center_clight_layer, 0, 0, SoftLightCompositeOp) # 中央を暗く
      end

      if e.mode == "cdark"
        out_layer = src_layer.composite(cloud_layer, 0, 0, SoftLightCompositeOp)     # 濃くして
        out_layer = out_layer.composite(center_clight_layer, 0, 0, ScreenCompositeOp) # 中央を明るく
      end

      if e.mode == "cdark2"
        out_layer = src_layer.composite(cloud_layer, 0, 0, PegtopLightCompositeOp)     # かなり濃くして
        out_layer = out_layer.composite(center_clight_layer, 0, 0, ScreenCompositeOp) # 中央を明るく
      end

      if e.mode == "cdark_only"
        out_layer = src_layer.composite(cloud_layer, 0, 0, SoftLightCompositeOp)     # 濃くして
      end

    else
      out_layer = src_layer
    end

    if false
      out_layer = Image.read("logo:").first.resize(16, 16)
    end
    out_layer.write(e.file_path)
    d out_layer
    puts e.file_path
  end
end

# p PieceInfo.first.file_path
# exit

ENV["SILENT"] = "true"
generator = Generator.new
generator.run(BackgroundInfo)
generator.run(BoardInfo)
generator.run(PieceInfo)
generator.run(BoardGalleryInfo)
