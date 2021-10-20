require "./setup"

img = Magick::ImageList.new("logo:")
scaled_img = img.scale(300, 300)

font = "fonts/RictyDiminished-Bold.ttf"
draw = Magick::Draw.new

draw.annotate(scaled_img, 0, 0, 5, 5, '2014年も終わる') do
  self.font         = font
  self.fill         = 'blue'
  self.stroke       = 'red'
  self.stroke_width = 1
  self.pointsize    = 30
  self.gravity      = Magick::NorthWestGravity
end

# draw.annotate(scaled_img, 0, 0, 5, 5, '2014年も終わる') do
#   self.font      = font
#   self.fill      = 'blue'
#   self.stroke    = 'transparent'
#   self.pointsize = 30
#   self.gravity   = Magick::NorthWestGravity
# end

d scaled_img
