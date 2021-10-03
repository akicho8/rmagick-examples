# require "./setup"

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rmagick"
end

require "rmagick"
require "rmagick/version"
include Magick

VERSION        # => "4.2.2"
Magick_version # => "ImageMagick 7.1.0-5 Q16 x86_64 2021-08-22 https://imagemagick.org"

image1 = Image.read("logo:").first.transparent("white")
shadow1 = image1.shadow(-5, -5, 4, "50%") # -shadow 50x4-5-5
shadow1.write("shadow1.png")

if false
  # Wrong synthesis method
  image1 = shadow1.composite(image1, 0, 0, OverCompositeOp)
  canvas = Image.new(image1.columns, image1.rows) { |e| e.background_color = "white" }
  canvas.composite!(image1, 0, 0, OverCompositeOp)
  canvas.write("output2.png")
end

# Correct synthesis method
image_list = ImageList.new
image_list.new_image(image1.columns, image1.rows, SolidFill.new("white"))
image_list << shadow1
image_list << image1
image_list.flatten_images.write("output2.png")
