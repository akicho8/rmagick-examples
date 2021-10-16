require "bundler/setup"
# Dir.chdir(Bundler.root)
Bundler.require(:default)

require "rmagick/version"

include Magick

require "pathname"
require "fileutils"
require "matrix"
require "color"

KOMAIRO = "hsl(43,100%,81%)"    # 共有将棋盤の駒の色

PAKUTASO1 = "#{__dir__}/images/IS107112702_TP_V.png"

OFTEN_USE_OP = [
  ScreenCompositeOp,      # 白くなる
  PlusCompositeOp,        # かなり白くなる
  LinearDodgeCompositeOp, # かなり白くなる
  ColorDodgeCompositeOp,  # かなり白くなる
  BlendCompositeOp,       # かなり白くなる
  SoftLightCompositeOp,   # 濃くなる1
  PegtopLightCompositeOp, # 濃くなる2
  OverlayCompositeOp,     # 濃くなる3
  ColorBurnCompositeOp,   # かなり濃くなる
  DstAtopCompositeOp,     # 宇宙の惑星
]

class V < Vector
  def self.one
    self[1, 1]
  end

  def self.half
    self[0.5, 0.5]
  end

  def x
    self[0]
  end

  def y
    self[1]
  end
end

class Rect < Vector
  def w
    self[0]
  end

  def h
    self[1]
  end
end

Kernel.class_eval do
  private

  # p メソッドのような感覚で使う
  # name を指定すると preview アプリで見たときタイトルに出てわかりやすい
  def d(image, name = nil)
    if ENV["SILENT"]
      return image
    end
    if name.to_s.include?("=>")
      raise ArgumentError, name.inspect
    end
    name ||= "#{Time.now.strftime("%Y%m%d%H%M%S")}_#{Pathname($0).basename('.*')}_#{SecureRandom.hex}"
    file = Pathname("_tmp/#{name}.png").expand_path
    FileUtils.makedirs(file.dirname)
    image.write(file)
    puts file
    `open #{file}`
    image
  end

  def o(image, name = SecureRandom.hex)
    file = Pathname("_#{name}.png")
    FileUtils.makedirs(file.dirname)
    image.write(file)
    puts file
  end
end

Image.class_eval do
  def display
    d self
  end

  def to_file(*args)
    o self, *args
  end

  def debug_dot(x = 0, y = 0)
    gc = Draw.new
    gc.fill("white")
    gc.circle(x, y, x + 4, y)
    gc.draw(self)
    self
  end

  def debug_rect(*args)
    gc = Draw.new
    # gc.translate(columns / 2, rows / 2)
    gc.fill("rgba(0,0,0,0.3)")
    gc.rectangle(*args)
    gc.draw(self)
    self
  end
end
