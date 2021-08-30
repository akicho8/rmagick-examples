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
    end

    def update
      @y += 1
      if @y >= base.yn
        @y -= base.yn
      end
      @index += 1
    end

    def draw
      gc = Magick::Draw.new
      gc.annotate(base.canvas, base.char_w - 1, base.char_h - 1, x * base.char_w, y * base.char_h, char) do |e|
        e.font      = base.font_file.to_s
        e.fill      = base.main_color
        e.pointsize = base.char_w
        e.gravity   = Magick::CenterGravity
      end
    end

    def char
      base.char_list[@index.modulo(base.char_list.size)]
    end
  end

  attr_accessor :char_list
  attr_accessor :canvas
  attr_accessor :char_w
  attr_accessor :char_h
  attr_accessor :font_file
  attr_accessor :main_color
  attr_accessor :params

  def initialize(params = {})
    @params = params

    @char_w = 16
    @char_h = 16

    @generations = yn

    @dark_level = 0.16

    @font_file = Pathname("RictyDiminished-Bold.ttf").expand_path
    @main_color = "rgb(0,255,0)"

    @char_list = Bioshogi::TacticInfo.all_elements.collect(&:name).shuffle.join.chars.reverse
  end

  def run
    @canvas = Magick::Image.new(image_w, image_h) { |e| e.background_color = "black" }

    @points = xn.times.collect { |x| Ship.new(self, x) }

    @generations.times do
      @points.each do |point|
        point.update
        point.draw
      end
      gc = Magick::Draw.new
      gc.fill = "rgba(0,0,0,#{@dark_level})"
      gc.rectangle(0, 0, @canvas.columns - 1, @canvas.rows - 1)
      gc.draw(@canvas)
    end

    if true
      effect = @canvas.copy
      effect.colorspace = Magick::GRAYColorspace
      effect = effect.spread(6).blur_image(0, 2)
      effect.write("_matrix_effect.png")
      @canvas = @canvas.composite(effect, 0, 0, Magick::LinearDodgeCompositeOp)
    end

    @canvas.write(output)
    `open #{output}`
  end

  def yn
    @yn ||= image_h.fdiv(@char_h).ceil
  end

  def xn
    @xn ||= image_w.fdiv(@char_w).ceil
  end

  def image_w
    params[:image_w] || 1024
  end

  def image_h
    params[:image_h] || 768
  end

  def output
    params[:output] || "_matrix.png"
  end
end

App.new(image_w: 1024, image_h:  768, output: "_matrix_1024x768.png").run
App.new(image_w: 1600, image_h: 1200, output: "_matrix_1600x1200.png").run
