require "../setup"

class App
  # h: 30:赤み濃い 45:赤み薄い

  def run
    [
      { template: :piece1, color1: [43, 0.8, 0.750], },
      { template: :piece1, color1: [43, 0.8, 0.700], },
      { template: :piece1, color1: [43, 0.8, 0.650], },

      { template: :board1, color1: [43, 0.5, 0.520], },
      { template: :board1, color1: [43, 0.5, 0.540], },
      { template: :board1, color1: [43, 0.5, 0.560], },
      { template: :board1, color1: [43, 0.5, 0.580], },
      { template: :board1, color1: [43, 0.5, 0.600], },

      { template: :board1, color1: [43, 0.6, 0.520], },
      { template: :board1, color1: [43, 0.6, 0.540], },
      { template: :board1, color1: [43, 0.6, 0.560], },
      { template: :board1, color1: [43, 0.6, 0.580], },
      { template: :board1, color1: [43, 0.6, 0.600], },

      { template: :board1, color1: [43, 0.7, 0.520], },
      { template: :board1, color1: [43, 0.7, 0.540], },
      { template: :board1, color1: [43, 0.7, 0.560], },
      { template: :board1, color1: [43, 0.7, 0.580], },
      { template: :board1, color1: [43, 0.7, 0.600], },

    ].each.with_index do |e, i|
      unless e[:color2]
        h, s, l = e[:color1]
        e[:color2] = [h, s, l + 0.05] # だいたい 0.05 ぐらいの差が綺麗
      end
      e = templates[e[:template]].merge(e)
      source_file = Pathname("_output#{index(e).next}.groovy")
      source_file.write(source_body(e))
      puts fn(e)
      system "groovy #{source_file}"
      system "open #{fn(e)}"
      @index[e[:template]] += 1
    end
  end

  def source_body(e)
    list = []
    list << "wf.setRings(#{e[:ring]}f)                             // rings value" if e[:ring]
    list << "wf.setScale(#{e[:scale]})                             // スケール" if e[:scale]
    list << "wf.setStretch(#{e[:stretch]}f)                        // 伸張率" if e[:stretch]
    list << "wf.setAngle((float)(ImageMath.PI * 2 * #{e[:angle]})) // 角度" if e[:angle]
    list << "wf.setTurbulence(#{e[:turbulence]}f)                  // 乱れ" if e[:turbulence]
    list << "wf.setFibres(#{e[:fibres]})                           // 繊維の量" if e[:fibres]
    list << "def lc = new LinearColormap((int)0xFF#{hex_color(*e[:color1])}, (int)0xFF#{hex_color(*e[:color2])})"
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
    source << %(ImageIO.write(img, "png", new File("#{fn(e)}")))
    source.join("\n")
  end

  def fn(e)
    "../../bioshogi/lib/bioshogi/assets/images/#{e[:file_path]}" % index(e).next
  end

  def hex_color(h, s, l)
    Color::HSL.from_fraction(h / 360.0, s, l).html.sub("#", "")
  end

  def index(e)
    @index ||= Hash.new(0)
    @index[e[:template]]
  end

  def templates
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
        :turbulence => 0.5,     # 乱れ
        :fibres     => 0,       # →繊維の数。0だと綺麗
        :ring       => 0.15,    # →細かくなる
        :scale      => 100,     # →拡大する(これ以上拡大するとぼける)
        :stretch    => 15,      # →縦方向の伸張でこれ以上拡大するとほぼ縦線ばかりになる
      },
    }
  end
end

App.new.run
