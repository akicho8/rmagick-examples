require "bundler/setup"
Dir.chdir(Bundler.root)
Bundler.require(:default)

require "rmagick/version"

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
