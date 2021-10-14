require "../setup"
layer = Image.read("logo:").first
d layer.polaroid { |e|
  e.shadow_color = "gray40"
  e.pointsize = 12
}
