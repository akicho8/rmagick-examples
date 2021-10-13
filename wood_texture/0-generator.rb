# groovy の WoodFilter を ruby から無理矢理使って木目画像を生成

require "../setup"

class Generator
  COLOR_LUMINOSITY_GAP = 0.05  # 明さの差 0.05 ぐらいが綺麗

  # h: 30:赤み濃い 45:赤み薄い
  def params_list
    [
      { group: :board1, color1: [43, 0.5, 0.520], },
      { group: :board1, color1: [43, 0.5, 0.540], },
      { group: :board1, color1: [43, 0.5, 0.560], },
      { group: :board1, color1: [43, 0.5, 0.580], },
      { group: :board1, color1: [43, 0.5, 0.600], },

      { group: :board1, color1: [43, 0.6, 0.520], },
      { group: :board1, color1: [43, 0.6, 0.540], },
      { group: :board1, color1: [43, 0.6, 0.560], },
      { group: :board1, color1: [43, 0.6, 0.580], },
      { group: :board1, color1: [43, 0.6, 0.600], },

      { group: :board1, color1: [43, 0.7, 0.520], },
      { group: :board1, color1: [43, 0.7, 0.540], },
      { group: :board1, color1: [43, 0.7, 0.560], },
      { group: :board1, color1: [43, 0.7, 0.580], },
      { group: :board1, color1: [43, 0.7, 0.600], },

      { group: :piece1, color1: [43, 0.8, 0.750], },
      { group: :piece1, color1: [43, 0.8, 0.700], },
      { group: :piece1, color1: [43, 0.8, 0.650], },
    ]
  end

  def groups
    {
      :piece1 => {
        :file_path => "piece/groovy_piece_texture%02d.png",
        :width      => 256,
        :height     => 256,
        :angle      => 0,
        :turbulence => 0,
        :fibres     => 0,
        :ring       => 0.15,
        :scale      => 10,
        :stretch    => 100,
      },
      :board1 => {
        :file_path  => "board/groovy_board_texture%02d.png",
        :width      => 1080,
        :height     => 1080,
        :angle      => nil,     # 角度 一周1.0
        :turbulence => 0,       # 揺れ
        :fibres     => 0,       # →繊維の数。0だと綺麗
        :ring       => 0.15,    # →細かくなる
        :scale      => 100,     # →拡大する(これ以上拡大するとぼける)
        :stretch    => 15,      # →縦方向の伸張でこれ以上拡大するとほぼ縦線ばかりになる
      },
    }
  end

  def run
    params_list.each do |e|
      e = groups[e[:group]].merge(e)
      source_file = Pathname("_output%02d.groovy" % number_for(e))
      source_file.write(source_body(e))
      puts filename_for1(e)
      system "groovy #{source_file}"
      system "open #{filename_for1(e)}"
      @number_for[e[:group]] += 1
    end
  end

  def source_body(e)
    color2 = e[:color2]
    unless color2
      h, s, l = e[:color1]
      color2 = [h, s, l + COLOR_LUMINOSITY_GAP]
    end
    color2 = hex_color(*color2)
    list = []
    list << "wf.setRings(#{e[:ring]}f)                             // 複雑度" if e[:ring]
    list << "wf.setScale(#{e[:scale]})                             // 拡大率" if e[:scale]
    list << "wf.setStretch(#{e[:stretch]}f)                        // 縦伸張率" if e[:stretch]
    list << "wf.setAngle((float)(ImageMath.PI * 2 * #{e[:angle]})) // 角度" if e[:angle]
    list << "wf.setTurbulence(#{e[:turbulence]}f)                  // 揺れ" if e[:turbulence]
    list << "wf.setFibres(#{e[:fibres]})                           // 繊維の量" if e[:fibres]
    list << "def lc = new LinearColormap((int)0xFF#{hex_color(*e[:color1])}, (int)0xFF#{color2})"
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
    source << "def img = new BufferedImage(#{e[:width]}, #{e[:height]}, BufferedImage.TYPE_INT_RGB)"
    source << "def wf = new WoodFilter()"
    source << "#{list}"
    source << "img = wf.filter(img, null)"
    source << %(ImageIO.write(img, "png", new File("#{filename_for1(e)}")))
    source << %(ImageIO.write(img, "png", new File("#{filename_for2(e)}")))
    source.join("\n")
  end

  def filename_for1(e)
    "_output%02d.png" % number_for(e)
  end

  def filename_for2(e)
    "../../bioshogi/lib/bioshogi/assets/images/#{e[:file_path]}" % number_for(e)
  end

  def hex_color(h, s, l)
    Color::HSL.from_fraction(h / 360.0, s, l).html.sub("#", "")
  end

  def number_for(e)
    @number_for ||= Hash.new(1)
    @number_for[e[:group]]
  end

  new.run
end
