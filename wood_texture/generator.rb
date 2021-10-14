# groovy の WoodFilter を ruby から無理矢理使って木目画像を生成
# h: 30:赤み濃い 45:赤み薄い
require "../setup"

class BoardInfo
  include MemoryRecord
  memory_record [

    { color1: [43, 0.5, 0.520], mode: "clight", rg_level: 50, },
    { color1: [43, 0.5, 0.520], mode: "cdark",  rg_level: 50, },
    { color1: [38, 0.5, 0.520], mode: "clight", rg_level: 50, },
    { color1: [38, 0.5, 0.520], mode: "cdark",  rg_level: 50, },
    { color1: [33, 0.5, 0.520], mode: "clight", rg_level: 50, },
    { color1: [33, 0.5, 0.520], mode: "cdark",  rg_level: 50, },

    { color1: [43, 0.5, 0.720], mode: "clight", rg_level: 50, },
    { color1: [43, 0.5, 0.720], mode: "cdark",  rg_level: 50, },
    { color1: [38, 0.5, 0.720], mode: "clight", rg_level: 50, },
    { color1: [38, 0.5, 0.720], mode: "cdark",  rg_level: 50, },
    { color1: [33, 0.5, 0.720], mode: "clight", rg_level: 50, },
    { color1: [33, 0.5, 0.720], mode: "cdark",  rg_level: 50, },

    { color1: [43, 0.3, 0.720], mode: "clight", rg_level: 50, },
    { color1: [43, 0.3, 0.720], mode: "cdark",  rg_level: 50, },
    { color1: [38, 0.3, 0.720], mode: "clight", rg_level: 50, },
    { color1: [38, 0.3, 0.720], mode: "cdark",  rg_level: 50, },
    { color1: [33, 0.3, 0.720], mode: "clight", rg_level: 50, },
    { color1: [33, 0.3, 0.720], mode: "cdark",  rg_level: 50, },

    { color1: [43, 0.8, 0.720], mode: "clight", rg_level: 50, },
    { color1: [43, 0.8, 0.720], mode: "cdark",  rg_level: 50, },
    { color1: [38, 0.8, 0.720], mode: "clight", rg_level: 50, },
    { color1: [38, 0.8, 0.720], mode: "cdark",  rg_level: 50, },
    { color1: [33, 0.8, 0.720], mode: "clight", rg_level: 50, },
    { color1: [33, 0.8, 0.720], mode: "cdark",  rg_level: 50, },
  ]

  def file_path
    "../../bioshogi/lib/bioshogi/assets/images/board/groovy_board_texture%02d.png" % code.next
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
      :ring       => 0.15,    # →細かくなる
      :scale      => 100,     # →拡大する(これ以上拡大するとぼける)
      :stretch    => 15,      # →縦方向の伸張でこれ以上拡大するとほぼ縦線ばかりになる
      :color1     => color1,
      :color2     => color2,
      :cloud_blur => 50,
    }
  end
end

class BoardGalleryInfo
  include MemoryRecord

  records = [0.4, 0.5, 0.6].flat_map do |s|
    [43, 40, 37, 34].flat_map do |h|
      [
        nil,
        "slight",
        "cdark",
        "clight",
      ].flat_map do |mode|
        [15, 50].flat_map do |stretch|
          [0.15].flat_map do |ring|
            [0.520, 0.620].flat_map do |l|
              [50].flat_map do |cloud_blur|
                { color1: [h, s, l], mode: mode, rg_level: 50, stretch: stretch, ring: ring, cloud_blur: cloud_blur }
              end
            end
          end
        end
      end
    end
  end
  # records.count
  # pp records
  # exit
  memory_record records

  def file_path
    "../../shogi-extend/nuxt_side/static/x-texture/wood/%04d.png" % code.next
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
      :scale      => 100,     # →拡大する(これ以上拡大するとぼける)
      :stretch    => stretch,      # →縦方向の伸張でこれ以上拡大するとほぼ縦線ばかりになる
      :color1     => color1,
      :color2     => color2,
      :cloud_blur => cloud_blur,
    }
  end
end

class PieceInfo
  include MemoryRecord
  memory_record [
    { color1: [43, 0.8, 0.750], },
    { color1: [43, 0.8, 0.700], },
    { color1: [43, 0.8, 0.650], },
  ]

  def mode
  end

  def file_path
    "../../bioshogi/lib/bioshogi/assets/images/piece/groovy_piece_texture%02d.png" % code.next
  end

  def color2
    h, s, l = color1
    [h, s, l + 0.05]
  end

  def to_params
    {
      :width      => 256,
      :height     => 256,
      :angle      => 0,
      :turbulence => 0,
      :fibres     => 0,
      :ring       => 0.15,
      :scale      => 10,
      :stretch    => 100,
      :color1     => color1,
      :color2     => color2,
      :cloud_blur => 50,
    }
  end
end

class Generator
  COLOR_LUMINOSITY_GAP = 0.05  # 明さの差 0.05 ぐらいが綺麗

  def run(list)
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
      xcolor = Pixel.from_hsla(0, 0, e.rg_level).to_color(AllCompliance, false, 8, true)  # => "#FFFFFF"
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
    else
      out_layer = src_layer
    end

    out_layer.write(e.file_path)
    d out_layer

    puts e.file_path
  end
end

generator = Generator.new
# generator.run(BoardInfo)
# generator.run(PieceInfo)

ENV["SILENT"] = "true"
p BoardGalleryInfo.count
generator.run(BoardGalleryInfo)
