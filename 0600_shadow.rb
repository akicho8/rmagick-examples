require "./setup"

# layer = Image.new(400, 400) { |e| e.background_color = "transparent" }
#
# gc = Draw.new
# gc.fill("white")
# gc.circle(200, 200, 250, 200)
# gc.draw(layer)
#
# # 全部同じ？
# d layer.shadow(-20, -20, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
# d layer.shadow(  0,   0, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
# d layer.shadow(-10,  10, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
# d layer.shadow(-20,  20, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)
# d layer.shadow(-30,  30, 5, 1.0).composite(layer, 0, 0, OverCompositeOp)

# 本家のサンプル

# Draw a big red Bezier curve on a transparent background.
layer = Image.new(400, 400) { |e| e.background_color = 'none' }
gc = Draw.new
gc.fill("white")
gc.circle(200, 200, 250, 200)
gc.draw(layer)

d layer

# Create the shadow.
shadow = layer.shadow(-50, -50)
shadow # => /Users/ikeda/src/rmagick-examples/_tmp/20211003220700_-_f365188e7438147a201eed2a103edfad.png  416x416 358x358+-58+-58 DirectClass 16-bit
d shadow

image_list = ImageList.new
image_list.new_image(layer.columns, layer.rows, SolidFill.new('white'))
image_list << shadow
image_list << layer
d image_list.flatten_images
# >> /Users/ikeda/src/rmagick-examples/_tmp/20211003220700_-_f365188e7438147a201eed2a103edfad.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20211003220701_-_df93a4a151ba6c4f739f5a3eae94b611.png
# >> /Users/ikeda/src/rmagick-examples/_tmp/20211003220701_-_5dfc377134ae61d5926670ef8c626e4d.png
