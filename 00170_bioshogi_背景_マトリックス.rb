require "./setup"

class App
  class Ship
    attr_accessor :x
    attr_accessor :y
    attr_accessor :index
    attr_accessor :base

    def initialize(base, x)
      @base = base
      @x = x.to_f
      @y = rand(base.yn).to_f
      @index = rand(base.char_list.size)
      @speed = rand(1.0..1.5)
    end

    def update
      @y += @speed
      if @y >= base.yn
        @y -= base.yn
      end
      @index += 1
    end

    def draw
      gc = Draw.new
      rx = x * base.char_w
      ry = y * base.char_h
      gc.annotate(base.canvas, base.char_w - 1, base.char_h - 1, rx, ry, char) do |e|
        e.font      = base.font_file.to_s
        e.fill      = base.main_color
        e.pointsize = base.char_w + swing
        e.gravity   = CenterGravity
      end
    end

    def char
      base.char_list[@index.modulo(base.char_list.size)]
    end

    def swing
      a = base.char_w * 0.1
      b = base.char_w * 0.9
      rand(-a..b)
    end
  end

  attr_accessor :canvas
  attr_accessor :params

  def initialize(params = {})
    @params = params

    if seed
      srand(seed)
    end
  end

  def run
    @canvas = Image.new(image_w, image_h) { |e| e.background_color = "black" }

    @points = xn.times.collect { |x| Ship.new(self, x) }

    yn.times do
      @points.each do |point|
        point.update
        point.draw
      end
      gc = Draw.new
      gc.fill = "rgba(0,0,0,#{dark_level})"
      gc.rectangle(0, 0, @canvas.columns - 1, @canvas.rows - 1)
      gc.draw(@canvas)
    end

    if true
      original = @canvas.copy

      effect = original.copy
      effect.colorspace = GRAYColorspace
      effect = effect.spread(6)
      effect = effect.blur_image(0, 2)
      # effect = effect.motion_blur(0, 10, 90)
      effect.write("PNG24:_matrix_effect1.png")
      @canvas = @canvas.composite(effect, 0, 0, LinearDodgeCompositeOp)

      effect = original.copy
      # effect.colorspace = GRAYColorspace
      effect = effect.motion_blur(0, 20, 90)
      effect.write("PNG24:_matrix_effect2.png")
      @canvas = @canvas.composite(effect, 0, 0, ScreenCompositeOp)
    end

    FileUtils.makedirs(output.dirname)
    @canvas.write("PNG24:#{output}")
    # `open #{output}`
  end

  def yn
    @yn ||= image_h.fdiv(char_h).ceil
  end

  def xn
    @xn ||= image_w.fdiv(char_w).ceil
  end

  def image_w
    params[:image_w] || 1920
  end

  def image_h
    params[:image_h] || 1080
  end

  def char_w
    params[:char_w] || 14
  end

  def char_h
    params[:char_h] || 14
  end

  def main_color
    params[:main_color] || "hsla(#{main_hue},100%,50%,1.0)"
  end

  def main_hue
    params[:main_hue] || 120 + 20
  end

  def dark_level
    params[:dark_level] || 0.16 + 0.1
  end

  def seed
    params[:seed]
  end

  def char_list
    @char_list ||= -> {
      s = params[:char_list] || Bioshogi::TacticInfo.all_elements.collect(&:name).shuffle.join
      s = s.tr("ー→", "|↓")
      s.chars
    }.call
  end

  def font_file
    @font_file ||= Pathname("fonts/RictyDiminished-Bold.ttf").expand_path
  end

  def output
    Pathname(params[:output] || "_matrix.png").expand_path
  end
end

App.new(output: "../bioshogi/lib/bioshogi/assets/images/background/matrix.png", char_w: 20, char_h: 20, main_hue: 140).run

App.new(output: "twitter_banner_matrix1500x500.png", image_w: 640, image_h: 480, char_w: 16, char_h: 16).run

(1..100).each do |i|
  App.new(output: "twitter_banner_matrix/#{i}.png", image_w: 1500, image_h: 500, char_w: 14, char_h: 14, seed: i).run
end
