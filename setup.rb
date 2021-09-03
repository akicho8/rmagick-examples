require "bundler/setup"
Dir.chdir(Bundler.root)
Bundler.require(:default)

require "rmagick/version"

include Magick

require "pathname"
require "fileutils"
require "kconv"
require "matrix"

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
  def d(image, options = {})
    if ENV["SILENT"]
      return
    end
    name = options[:name] || "#{Time.now.strftime("%Y%m%d%H%M%S")}_#{Pathname($0).basename('.*')}_#{SecureRandom.hex}"
    file = Pathname("_tmp/#{name}.png").expand_path
    FileUtils.makedirs(file.dirname)
    image.write(file)
    `open #{file}`
  end

  def o(image, name)
    file = Pathname("_#{name}.png")
    FileUtils.makedirs(file.dirname)
    image.write(file)
    puts file
  end
end

Image.class_eval do
  def display
    d(self)
  end

  def to_file(*args)
    o(self, *args)
  end
end
