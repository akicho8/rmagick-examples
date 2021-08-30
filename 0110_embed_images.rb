require "./setup"
rows = [:rose, :wizard, :logo, :granite, :netscape].collect do |e|
  file = Pathname("_embed_images/#{e}.png")
  image = Magick::Image.read("#{e}:").first
  image.format = "PNG24"
  FileUtils.makedirs(file.dirname)
  image.write(file)
  {
    :file    => file,
    :width   => image.columns,
    :height  => image.rows,
    :inspect => image.inspect.toutf8,
  }
end
`open _embed_images`
tp rows
# >> |----------------------------+-------+--------+--------------------------------------------------------------------------------------------|
# >> | file                       | width | height | inspect                                                                                    |
# >> |----------------------------+-------+--------+--------------------------------------------------------------------------------------------|
# >> | _embed_images/rose.png     |    70 |     46 | rose:=>_embed_images/rose.png PNG24 70x46 70x46+0+0 DirectClass 8-bit 6kb                  |
# >> | _embed_images/wizard.png   |   480 |    640 | wizard:=>_embed_images/wizard.png PNG24 480x640 480x640+0+0 PseudoClass 256c 8-bit 85kb    |
# >> | _embed_images/logo.png     |   640 |    480 | logo:=>_embed_images/logo.png PNG24 640x480 640x480+0+0 PseudoClass 256c 8-bit 26kb        |
# >> | _embed_images/granite.png  |   128 |    128 | granite:=>_embed_images/granite.png PNG24 128x128 128x128+0+0 PseudoClass 16c 8-bit 6kb    |
# >> | _embed_images/netscape.png |   216 |    144 | netscape:=>_embed_images/netscape.png PNG24 216x144 216x144+0+0 PseudoClass 256c 8-bit 1kb |
# >> |----------------------------+-------+--------+--------------------------------------------------------------------------------------------|
