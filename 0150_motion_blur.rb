require "./setup"
# image = Magick::Image.read("images/matrix_1024x768.png").first
image = Magick::Image.read("logo:").first
image = image.motion_blur(0, 10, 90 * 3) # radius, sigma, angle
file = Pathname("_motion_blur.png")
FileUtils.makedirs(file.dirname)
image.write(file)
`open _motion_blur.png`
