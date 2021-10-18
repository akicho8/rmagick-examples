require "./setup"

def test(png_type)
  image = Image.read("logo:").first
  image.write("#{png_type}:_output.png")
  `exiftool _output.png | grep 'Color Type'`.strip.sub(/.*:\s*/, "")
end

test("PNG8")  # => "Palette"
test("PNG16") # => "Palette"
test("PNG24") # => "RGB"
test("PNG32") # => "RGB with Alpha"
test("PNG48") # => "RGB"
